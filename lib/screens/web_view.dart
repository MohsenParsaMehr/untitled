import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WebView extends StatefulWidget {
  const WebView(Key key) : super(key: key);

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  Future<void> _pullRefresh() async {
    setState(() {});
  }

  int _stackIndex = 1;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: (kIsWeb ||
              Theme.of(context).platform == TargetPlatform.android ||
              Theme.of(context).platform == TargetPlatform.iOS
          ? Expanded(
              child: // IndexedStack(index: _stackIndex, children: [
                  InAppWebView(
                initialUrlRequest:
                    URLRequest(url: WebUri('https://app.sadeghieh.com')),
                initialSettings: InAppWebViewSettings(
                    //crossPlatform: InAppWebViewOptions(
                    //useShouldOverrideUrlLoading: true),
                    ),
                onLoadStop: (_, __) {
                  setState(() {
                    _stackIndex = 0;
                  });
                  throw Exception('Error');
                },
                onReceivedError: (controller, request, error) => {
                  setState(() {
                    _stackIndex = 0;
                  }),
                  throw Exception('Error'),
                },
                onReceivedHttpError: (controller, request, errorResponse) => {
                  setState(() {
                    _stackIndex = 0;
                  }),
                  throw Exception('Error')
                },
              ),
              //] )
            )
          : const Text('Please visit app.***.com')),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //if (state == AppLifecycleState.paused) {

    //}
  }
}
