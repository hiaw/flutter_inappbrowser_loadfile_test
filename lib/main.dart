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
            initialUrl: "https://flutter.io/",
            initialHeaders: {},
            initialOptions: {},
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
          ),
        ),
      ),
    );
  }
}
