
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../utils/app_colors.dart';
import 'button/custom_button.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.noInternet),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
                child: Icon(
              Icons.wifi_off,
              size: 100,
            )),
            CustomText(
              text: AppString.noInternet,
              fontSize: 18.sp,
              top: 16.h,
            ),
            CustomText(
              text: AppString.checkInternet,
              top: 8.h,
              bottom: 20.h,
            ),
            CustomButton(
              onPressed: () => Get.back(),
              titleText: AppString.back,
              buttonWidth: 80.w,
              buttonHeight: 40.h,
              buttonColor: AppColors.grey900,
            )
          ],
        ),
      ),
    );
  }
}
