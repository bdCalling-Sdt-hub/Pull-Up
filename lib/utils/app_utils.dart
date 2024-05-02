import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.primaryColor,
      textColor: AppColors.white50,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,


    );
  }

  static snackBarMessage(String title, String message) {
    Get.snackbar(kDebugMode ? title : 'oops!', message,
        backgroundColor: AppColors.white50);
  }
}
