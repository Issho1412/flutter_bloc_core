import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:src_core_bloc/core/base/base_event.dart';
import 'package:src_core_bloc/core/util/style/colors.dart';
import '../../../core/base/base_state.dart';

class WebviewBloc extends Bloc<BaseEvent, BaseState> {
  String currentUrl = 'https://www.w3schools.com/';
  double progress = 0;
  late InAppWebViewController webViewController;
  late PullToRefreshController pullToRefreshController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  WebviewBloc() : super(const InitialState()) {
    on<InitDataEvent>((event, emit) {
      emit(DataLoadingState());
      initPullRefresh();
      emit(const DataLoadedState());
    });

    on<UpdateDataEvent>((event, emit) {
      emit(DataLoadingState());
      emit(const DataLoadedState());
    });
    init();
  }

  void init() {
    log('WebviewBloc init');
    initPullRefresh();
  }

  void initPullRefresh() {
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: ColorConst.kTxtInfo,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController.reload();
        } else if (Platform.isIOS) {
          webViewController.loadUrl(
              urlRequest: URLRequest(url: await webViewController.getUrl()));
        }
      },
    );
  }

  void onWebViewCreated(InAppWebViewController controller) {
    controller.clearCache();
    webViewController = controller;
  }

  onLoadStart(InAppWebViewController controller, Uri? url) {
    log('url started: $url');
    currentUrl = url.toString();
  }

  onLoadStop(InAppWebViewController controller, Uri? url) {
    log('url stop: $url');
    currentUrl = url.toString();
  }

  void onProgressChanged(InAppWebViewController controller, int mprogress) {
    if (mprogress == 100) {
      pullToRefreshController.endRefreshing();
    }
    progress = mprogress / 100;
    if (progress == 1.0) {
      add(UpdateDataEvent());
    }
    log('progress: $progress');
  }
}
