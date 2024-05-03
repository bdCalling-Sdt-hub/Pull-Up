import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_utils.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../../../utils/app_string.dart';

class ClearPopUp {
  static clearHistoryPopUp() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.grey300,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.clearHistory,
                fontSize: 20.sp,
                color: AppColors.white50,
                fontWeight: FontWeight.w600,
                bottom: 8.h,
              ),
              CustomText(
                text: AppString.clearYourKeywordsLocationAndRecentHistory,
                color: AppColors.white50,
                bottom: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    titleText: AppString.no,
                    onPressed: () => Get.back(),
                    buttonColor: AppColors.transparent,
                    buttonWidth: 95.w,
                    buttonHeight: 35.h,
                    borderColor: AppColors.white50,
                  ),
                  CustomButton(
                    titleText: AppString.yes,
                    onPressed: () {
                      Utils.toastMessage(
                          message: AppString.removeYourAllHistory);
                      Get.toNamed(AppRoute.home);
                    },
                    buttonWidth: 95.w,
                    buttonHeight: 35.h,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
