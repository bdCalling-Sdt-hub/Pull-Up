import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage({required String message, IconData icon = Icons.check}) {
    FToast fToast = FToast();

    if (Get.context != null) {
      fToast.init(Get.context!);
      Widget toast = Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: AppColors.primaryColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            SizedBox(
              width: 12.w,
            ),
            Flexible(
              child: CustomText(
                text: message,
                textAlign: TextAlign.center,
                maxLines: 2,
                color: AppColors.background,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );

      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2),
      );
    } else {
      Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.greenAccent,
        textColor: AppColors.white50,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  static snackBarMessage(String title, String message) {
    Get.snackbar(kDebugMode ? title : 'oops!', message,
        backgroundColor: AppColors.white50);
  }
}
