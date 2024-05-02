import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_utils.dart';

class OtherService {
  static FToast fToast = FToast();

  static showToast() {
    if (Get.context != null) return;
    fToast.init(Get.context!);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }

  static checkConnection() {
    StreamSubscription subscription =
        Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    });
  }

  static checkInternet() async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      Utils.toastMessage("Not Connected");
    } else {
      Utils.toastMessage("Connected with ${connectivityResult[0]}");
    }
  }
}
