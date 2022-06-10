import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewMenu extends StatefulWidget {
  const WebViewMenu({Key? key}) : super(key: key);

  @override
  State<WebViewMenu> createState() => _WebViewMenuState();
}

class _WebViewMenuState extends State<WebViewMenu> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // ignore: prefer_const_literals_to_create_immutables
        appBar: AppBar(
          // ignore: prefer_const_constructors
          backgroundColor: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          actions: [
            IconButton(
                onPressed: () async {
                  controller.goBack();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.blueGrey,
                )),
            IconButton(
                onPressed: () async {
                  controller.reload();
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.blueGrey,
                ))
          ],
          iconTheme: const IconThemeData(color: Colors.blueGrey),
        ),
        // drawer: const Navbar(),
        // ignore: prefer_const_constructors
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://newsapi.org',
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ));
  }
}
