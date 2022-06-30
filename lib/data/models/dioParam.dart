// ignore_for_file: file_names
import 'package:src_core_bloc/core/util/enum.dart';

class DioParams {
  final HttpMethod httpMethod;
  final String? url;
  final String endpoint;
  final bool dynamicResponse;
  final Map<String, String>? headers;
  final Map<String, dynamic>? params;
  final dynamic body;
  final bool needAuthrorize;
  final bool shouldHandleResponse;
  final List<int> allowedStatusCodes;

  DioParams(this.httpMethod,
      {this.url,
      required this.endpoint,
      this.headers,
      this.params,
      this.body,
      this.dynamicResponse = false,
      this.needAuthrorize = true,
      this.shouldHandleResponse = true,
      this.allowedStatusCodes = const []});
}
