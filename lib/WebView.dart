import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPage extends StatefulWidget {
  String url;
  WebViewPage(this.url);
  @override
  _WebViewPageState createState() => _WebViewPageState(url);
}

class _WebViewPageState extends State<WebViewPage> {
  String url;
  _WebViewPageState(this.url);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      initialChild: Center(child: CircularProgressIndicator()),
      url: url,
    );
  }
}
