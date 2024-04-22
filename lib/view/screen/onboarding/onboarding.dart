import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Row(
              children: [
                CustomText(
                  text: AppString.welcomeTo,
                  fontSize: 18.h,
                  color: AppColors.white50,
                ),
                CustomText(
                  text: AppString.pullUp,
                  fontSize: 20.h,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: AppString.thereSoMuchToExplore,
                  color: AppColors.grey200,
                  top: 12.h,
                  bottom: 34.h,
                )),
            CustomImage(
              imageSrc: AppImages.onboarding,
              imageType: ImageType.png,
              size: 322.sp,
            ),
            SizedBox(
              height: 60.h,
            ),
            CustomButton(
              titleText: AppString.createAccount,
              onPressed: () => Get.toNamed(AppRoute.createAccount),
            ),
            SizedBox(
              height: 9.h,
            ),
            CustomButton(
              titleText: AppString.logGuest,
              onPressed: () => Get.offAllNamed(AppRoute.home),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: AppString.alreadyHaveAccount,
                  color: AppColors.grey200,
                ),
                SizedBox(
                  width: 4.w,
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoute.login),
                  child: const CustomText(
                    text: AppString.login,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
