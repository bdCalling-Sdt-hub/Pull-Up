import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/utils/app_utils.dart';

class OtherService {
  static bool isFirst = true;

  static checkConnection() {
    Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    });
  }

  static checkInternet() async {
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      Utils.toastMessage(
          message: AppString.youAreCurrentlyOffline, icon: Icons.wifi_off);
    } else {
      if (isFirst) {
        if (connectivityResult.contains(ConnectivityResult.none)) {
          Utils.toastMessage(
              message: AppString.youAreCurrentlyOffline, icon: Icons.wifi_off);
        }
      } else {
        Utils.toastMessage(
            message: AppString.yourInternetConnectionIsRestored,
            icon: Icons.wifi);
      }
    }
    isFirst = false ;

  }
}
