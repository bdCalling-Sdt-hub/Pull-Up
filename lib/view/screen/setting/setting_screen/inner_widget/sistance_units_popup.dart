import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../../../utils/app_string.dart';

class DistancePopUp {
  static distanceUnitsPopUp() {
    List<String> options = [AppString.kilometers, AppString.miles];
    RxString currentOption = options[0].obs;
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
                text: AppString.distanceUnits,
                fontSize: 20.sp,
                color: AppColors.white50,
                fontWeight: FontWeight.w600,
                bottom: 8.h,
              ),
              Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      options.length,
                      (index) => InkWell(
                        onTap: () {
                          currentOption.value = options[index];
                        },
                        child: Row(
                          children: [
                            Radio<String>(
                              activeColor: AppColors.primaryColor,
                              fillColor: currentOption.value == options[index]
                                  ? null
                                  : MaterialStateProperty.all(
                                      AppColors.white50),
                              value: options[index],
                              groupValue: currentOption.value,
                              onChanged: (value) {
                                currentOption.value = options[index];
                              },
                            ),
                            CustomText(
                              text: options[index],
                              fontSize: 18.sp,
                              color: AppColors.white50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    titleText: AppString.done,
                    onPressed: () => Get.back(),
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
