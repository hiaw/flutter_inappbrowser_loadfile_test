import 'package:flutter/material.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

InAppLocalhostServer localhostServer = InAppLocalhostServer();

Future main() async {
  await localhostServer.start();
  runApp(MyApp());
}

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
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                await webView.loadUrl("http://localhost:8080/assets/lite.html");
              },
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: InAppWebView(
                  onWebViewCreated: (InAppWebViewController controller) {
                    webView = controller;
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    print(progress);
                  },
                  onLoadError: (InAppWebViewController controller, String url,
                      int code, String message) {
                    print('$url: $code \n $message');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
