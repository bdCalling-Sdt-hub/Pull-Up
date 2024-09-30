import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widget/text/custom_text.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController locationName = TextEditingController();
  late final WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.google.com'));
    controller.setOnConsoleMessage((message) {
      if (kDebugMode) {
        print("message: =========>> ${message.message}");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: CustomText(
          text: 'Google Search'.tr,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        )),
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_forward_ios),
          ),
        ),
        actions: [
          SizedBox(
            width: 50.w,
          ),
        ],
      ),
      body: WebViewWidget(controller: controller),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await screenShotHelper
      //         .captureAndSaveImage(screenshotController: screenshotController)
      //         .then((value) =>
      //             storageController.getOnlineImage(imageBytes: value));
      //   },
      //   backgroundColor: AppColors.black_500,
      //   child: const Icon(
      //     Icons.camera_alt,
      //     color: AppColors.green_500,
      //   ),
      // ),
    );
  }
}
