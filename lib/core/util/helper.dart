import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../routes/locator.dart';
import '../routes/navigate_service.dart';
import 'enum.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:src_core_bloc/core/util/api_url.dart';
import '../../data/models/dioParam.dart';
import '../connection/networkClient.dart';
import '../connection/networkInfo.dart';

class Helper extends NetworkClient<dynamic, DioParams> {
  DateTime currentBackPressTime = DateTime.now();
  static final Helper _instance = Helper._internal();
  final NavigationService _navigationService = locator<NavigationService>(); 

  Helper._internal();

  factory Helper() {
    return _instance;
  }

  Future<bool> checkNetwork() async {
    final NetworkInfo _networkInfo = NetworkInfo();
    if (await _networkInfo.isConnected) {
      return true;
    } else {
      // showToast('network_error'.tr, ToastType.fail);
      return false;
    }
  }

  Future delay(int second) async {
    await Future.delayed(Duration(seconds: second));
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  String formatDate(DateTime date, [String? formatString]) {
    return DateFormat(formatString ?? 'yyyy年MM月dd日(E)', 'ja,JP').format(date);
  }

  // Connect api with method 
  Future<Response> _connect(HttpMethod method, {
    required String url,
    String? contentType,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    Dio dio = Dio();
    if (headers != null) {
      dio.options = BaseOptions(
          headers: headers,
          contentType: contentType ?? Headers.formUrlEncodedContentType,
          followRedirects: false,
          validateStatus: (statusCode) {
            return statusCode! <= 1000;
          });
    }

    switch (method) {
      case HttpMethod.DELETE:
        return _handleCall(() async {
          return (await dio.delete(url,
              data:
                  //FormData.fromMap(body ?? {})
                  body,
              queryParameters: headers));
        });
      case HttpMethod.GET:
        return _handleCall(() async {
          final response = (await dio.get(url));
          return response;
        });
      case HttpMethod.POST:
        return _handleCall(() async {
          return (await dio.post(url, queryParameters: headers, data: body));
        });
      case HttpMethod.PUT:
        return _handleCall(() async {
          return (await dio.put(url, queryParameters: headers, data: body));
        });
      case HttpMethod.PATCH:
        return _handleCall(() async {
          return (await dio.patch(url, queryParameters: headers, data: body));
        });
      default:
        return _handleCall(() async {
          final response = (await dio.get(url, queryParameters: headers));
          return response;
        });
    }
  }

  // METHOD FOR NAVIGATION SERVICE
   Future<dynamic> navigateTo(String routeName, {dynamic args}) {
    return _navigationService.navigateTo(routeName, args: args);
  }

  Future<dynamic> navigateReplaceTo(String routeName, {dynamic args}) {
    return _navigationService.navigateReplaceTo(routeName, args: args);
  }

  void goBack() {
    return _navigationService.goBack();
  }

  // API Call request solve
  Future<T> _handleCall<T>(Future<T> Function() onRequest) async {
    try {
      return onRequest().timeout(const Duration(seconds: 25));
    } on TimeoutException catch (_) {
      throw 'Request timeout!!';
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future call(DioParams params, {String? contentType}) async{
     String url = '';
    if (params.url == null) {
      url = '${APIUrl.baseURL}${params.endpoint}';
    } else {
      url = '${params.url}${params.endpoint}';
    }
    if (params.params != null) {
      url += '?';
      if (params.params != null) {
        params.params!.forEach((key, value) {
          url += '$key=$value&';
        });
      }
    }
    Map<String, String> header = params.headers ?? <String, String>{};

    //Add 
    // header.addEntries({'key': value);

    if (params.needAuthrorize) {
      // String? token = Storage().getToken;
      // header['Authorization'] = 'Bearer ${token ?? ''}';
      // log(token.toString());
    }
    log('${params.httpMethod}: $url ${params.body.toString()}');
    try {
      final rawResponse =
          (await _connect(params.httpMethod, url: url, headers: header, body: params.body, contentType: contentType));
      // log(rawResponse.toString());
      // ignore: prefer_typing_uninitialized_variables
      var response;
      if (params.shouldHandleResponse) {
        response = rawResponse.handleError(params.allowedStatusCodes);
      } else {
        response = rawResponse.data;
      }
      return response!;
    } catch (e) {
      throw e.toString();
    }
  }
}

extension ResponseExtension on Response {
  Map<String, dynamic>? handleError(List<int> allowedStatusCodes) {
    if (data == null) return {};
    Map<String, dynamic> json;
    if ((allowedStatusCodes.contains(statusCode)) || statusCode! < 400) {
      if (data is! Map<String, dynamic>) {
        json = jsonDecode(data);
      } else {
        json = data;
      }
      return json;
    } else {
      // if (statusCode == 400) {
      //   Observable().notifyListeners((observer) => observer.onUnAuthorized());
      // }
      String errorText = "";
      if (data["errors"] != null) {
        Map<dynamic, dynamic> errors = data["errors"];
        if (errors.values.isEmpty || errors.values.toList()[0] == null || (errors.values.toList()[0] as List).isEmpty) {
          errorText = 'エラー！エラーが発生しました。しばらくしてからもう一度お試しください。';
        }
        errorText = errors.values.toList()[0][0];
      } else if (data["message"] != null && data["message"] != "") {
        errorText = data["message"];
      } else {
        errorText = 'エラー！エラーが発生しました。しばらくしてからもう一度お試しください。';
      }
      throw errorText;
    }
  }
}
