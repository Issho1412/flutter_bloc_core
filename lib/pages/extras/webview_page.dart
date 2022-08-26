import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:src_core_bloc/core/base/base_state.dart';
import 'package:src_core_bloc/core/util/helper.dart';
import 'package:src_core_bloc/features/extras/webview/webview_bloc.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({Key? key, required this.data}) : super(key: key);
  final Map<String, dynamic> data;

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final WebviewBloc _webviewBloc = WebviewBloc();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Helper().onWillPop,
      child: SafeArea(
        child: BlocBuilder<WebviewBloc, BaseState>(
          bloc: _webviewBloc,
          builder: (context, _) {
            return Stack(
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(url: Uri.parse( _webviewBloc.currentUrl,)),
                  initialOptions: _webviewBloc.options,
                  onWebViewCreated: _webviewBloc.onWebViewCreated,
                  onLoadStop: _webviewBloc.onLoadStop,
                  onLoadStart: _webviewBloc.onLoadStart,
                  onProgressChanged: _webviewBloc.onProgressChanged,
                  pullToRefreshController: _webviewBloc.pullToRefreshController,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: _webviewBloc.progress < 1.0 
                    ? LinearProgressIndicator(value: _webviewBloc.progress,)
                    : const SizedBox()
                ),
              ]
            );
          }
        ),
      )
    );
  }
}
