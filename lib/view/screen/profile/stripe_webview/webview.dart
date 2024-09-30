import 'package:flutter/material.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  const Webview({super.key});

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {

  @override
  void initState() {
    ProfileController.instance.createStripeAccount() ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
          controller: ProfileController.instance.webViewController),
    );
  }
}
