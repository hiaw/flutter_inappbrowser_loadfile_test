import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

InAppLocalhostServer localhostServer = InAppLocalhostServer();
InAppWebViewController webView;

Future main() async {
  await localhostServer.start();
  runApp(MyApp());

  await Future.delayed(const Duration(milliseconds: 500));
  await webView.loadUrl("http://localhost:8080/assets/lite.html");
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
          ),
        ),
      ),
    );
  }
}
