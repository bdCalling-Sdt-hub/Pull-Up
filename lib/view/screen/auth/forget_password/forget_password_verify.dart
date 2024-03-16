import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/custom_image.dart';

import '../../../../utils/app_colors.dart';
import '../../../widget/button/custom_button.dart';
import '../../../widget/text/custom_text.dart';

class ForgetPasswordEmailVerify extends StatelessWidget {
  ForgetPasswordEmailVerify({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: const AppbarIcon(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(
                  imageSrc: AppImages.emailVerifyLogo,
                  imageType: ImageType.png,
                  size: 170.sp,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 5.h,
                      width: 88.w,
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(64.r))),
                    ),
                    Container(
                      height: 5.h,
                      width: 88.w,
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(64.r))),
                    ),
                    Container(
                      height: 5.h,
                      width: 88.w,
                      decoration: BoxDecoration(
                          color: AppColors.grey200,
                          borderRadius:
                              BorderRadius.all(Radius.circular(64.r))),
                    )
                  ],
                ),
                CustomText(
                  text: AppString.checkEmailOtp,
                  fontSize: 20.sp,
                  color: AppColors.white50,
                  fontWeight: FontWeight.w600,
                  bottom: 96.h,
                  top: 60.h,
                ),
                Flexible(
                  flex: 0,
                  child: PinCodeTextField(
                    cursorColor: AppColors.white50,
                    textStyle: const TextStyle(color: AppColors.white50),
                    // controller: controller.otpController,
                    appContext: (context),

                    validator: (value) {
                      if (value!.length < 5) {
                        return AppString.pleaseEnterTheOTPCode;
                      }
                      return null;
                    },
                    autoFocus: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 52.h,
                      fieldWidth: 50.w,
                      activeFillColor: AppColors.transparent,
                      selectedFillColor: AppColors.transparent,
                      inactiveFillColor: AppColors.transparent,
                      borderWidth: 0.5.w,
                      errorBorderColor: AppColors.primaryColor,
                      selectedColor: AppColors.primaryColor,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.primaryColor,
                    ),
                    length: 5,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.disabled,
                    enableActiveFill: false,
                  ),
                ),
                const CustomText(text: AppString.resendCode),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: CustomButton(
                      titleText: AppString.next,
                      onPressed: () {
                        Get.toNamed(AppRoute.forgetPasswordResetPassword);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
