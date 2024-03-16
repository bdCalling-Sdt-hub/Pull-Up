import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../widget/text_field/custom_text_field.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              imageSrc: AppImages.onboarding,
              imageType: ImageType.png,
              size: 286.w,
            ),
            CustomText(
              text: AppString.loginYourAccount,
              fontSize: 24.sp,
              color: AppColors.white50,
              bottom: 22.h,
            ),
            const CustomTextField(
              labelText: AppString.emailOrUsername,
            ),
            SizedBox(
              height: 20.h,
            ),
            const CustomTextField(
              labelText: AppString.password,
              isPassword: true,
            ),
            Align(
                alignment: FractionalOffset.centerRight,
                child: GestureDetector(
                  onTap: () => Get.toNamed(AppRoute.forgetPasswordCheckEmail),

                  child: CustomText(
                    text: AppString.forgetPassword,
                    color: AppColors.white50,
                    top: 16.h,
                    bottom: 23.h,
                  ),
                )),
            CustomButton(titleText: AppString.login, onPressed: () => Get.offAllNamed(AppRoute.home),),
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(text: AppString.doNotHaveAccount,),
                SizedBox(
                  width: 4.w,
                ),
                const CustomText(
                  text: AppString.registerNow,
                  color: AppColors.primaryColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
