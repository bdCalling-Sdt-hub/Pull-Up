import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class PopUp {
  static successfulPopUp() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                SizedBox(height: 20.h,), 
                CustomImage(imageSrc: AppIcons.right, ),
                CustomText(text: AppString.successful, fontSize: 24.sp, fontWeight: FontWeight.w600, color: AppColors.primaryColor,bottom: 10.h,top: 10.h,),
                CustomText(text: AppString.yourPurchaseSuccessfullyDone, fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColors.primaryColor,bottom: 16.h,),
                CustomButton(titleText: AppString.goToHome, buttonWidth: 130.w, buttonHeight: 36.h, onPressed: () => Get.offAllNamed(AppRoute.home),)

              ],
            ),
          );
        });
  }
}
