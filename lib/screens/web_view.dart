import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: Expanded(
              child: // IndexedStack(index: _stackIndex, children: [
                  InAppWebView(
                initialUrlRequest:
                    URLRequest(url: WebUri('http://app.sadeghieh.com')),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform:
                      InAppWebViewOptions(useShouldOverrideUrlLoading: true),
                ),
                onLoadStop: (_, __) {
                  setState(() {
                    _stackIndex = 0;
                  });
                  throw Exception('Error');
                },
                onLoadError: (_, __, ___, ____) {
                  setState(() {
                    _stackIndex = 0;
                  });
                  throw Exception('Error');
                },
                onLoadHttpError: (_, __, ___, ____) {
                  setState(() {
                    _stackIndex = 0;
                  });
                  //TODO: Show error alert message (Error in receive data from server)
                  throw Exception('Error');
                },
              ),
              //] )
            )));
  }
}
