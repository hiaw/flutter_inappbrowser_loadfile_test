import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Inline WebView example app'),
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          child: InAppWebView(
            initialFile: "assets/index.html",
            initialHeaders: {},
            initialOptions: {},
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadError: (InAppWebViewController controller, String url,
                int code, String message) {
              print(message);
              print(code);
              print(url);
            },
          ),
        ),
      ),
    );
  }
}
