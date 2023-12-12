import 'package:api_class3/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Repo/tokeanRepo.dart';
import 'home.dart';
class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
            print("onPageStarted= ${progress}");
          },

          onPageStarted: (String url) {
            print("onPageStarted = ${url}");
if(url.contains("code=")){
  code=extractCodeFromUrl(redirectUrl: url);
  EasyLoading.showSuccess("Login Done");
  getTokeanRepo();
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
}
          },

          onPageFinished: (String url) {
            print("onPageFinished = ${url}");
          },
          onWebResourceError: (WebResourceError error) {
            print("onWebResourceError = ${error}");
          },
        ),
      )
      ..loadRequest(Uri.parse("https://todoist.com/oauth/authorize?client_id=$clientId&scope=data:read,data:delete&state=$states"));

    return Scaffold(
      body:  SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}
