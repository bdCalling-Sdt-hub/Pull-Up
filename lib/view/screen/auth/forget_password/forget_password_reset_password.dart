import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pull_up/controller/auth/forgot_password_controller.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/custom_loading.dart';
import 'package:pull_up/view/widget/text_field/custom_text_field.dart';

import '../../../../helper/reg_exp_helper.dart';
import '../../../../utils/app_colors.dart';
import '../../../widget/button/custom_button.dart';
import '../../../widget/text/custom_text.dart';

class ForgetPasswordResetPassword extends StatelessWidget {
  ForgetPasswordResetPassword({super.key});

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
        body: GetBuilder<ForgotPasswordController>(
          builder: (controller) {
            return SingleChildScrollView(
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
                              color: AppColors.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(64.r))),
                        )
                      ],
                    ),
                    Align(
                      alignment: FractionalOffset.centerLeft,
                      child: CustomText(
                        text: AppString.resetPassword,
                        fontSize: 20.sp,
                        color: AppColors.white50,
                        fontWeight: FontWeight.w600,
                        bottom: 46.h,
                        top: 60.h,
                      ),
                    ),
                    CustomTextField(
                      controller: controller.passwordController,
                      labelText: AppString.password,
                      isPassword: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppString.thisFieldIsRequired;
                        } else if (value.length < 8) {
                          return AppString.passwordValidator;
                        } else if (!RegExpHelper.passRegExp.hasMatch(value)) {
                          return AppString.passwordValidator;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextField(
                      controller: controller.confirmPasswordController,
                      labelText: AppString.confirmPassword,
                      isPassword: true,
                      onSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          controller.resetPasswordRepo();
                        }
                      },
                      validator: (value) {
                        if (controller.passwordController.text != value) {
                          return AppString.passwordDoseNotMatch;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: controller.isLoadingReset
                          ? const CustomElevatedLoadingButton()
                          : CustomButton(
                              titleText: AppString.reset,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  controller.resetPasswordRepo();
                                }
                              }),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
