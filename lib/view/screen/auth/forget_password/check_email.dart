import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/auth/forgot_password_controller.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/custom_loading.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';
import 'package:pull_up/view/widget/text_field/custom_text_field.dart';

import '../../../../utils/app_colors.dart';
import '../../../widget/custom_image.dart';

class ForgetPasswordCheckEmail extends StatelessWidget {
  ForgetPasswordCheckEmail({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
      ),
      body: GetBuilder<ForgotPasswordController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.h),
            child: Form(
              key: formKey,
              child: Column(
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
                            color: AppColors.grey200,
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
                  Align(
                      alignment: FractionalOffset.centerLeft,
                      child: CustomText(
                        text: AppString.forgotPassword,
                        color: AppColors.white50,
                        fontSize: 24.sp,
                        top: 70.h,
                        bottom: 20.h,
                      )),
                  CustomText(
                    text: AppString.emailAddressAssociated,
                    textAlign: TextAlign.start,
                    bottom: 24.h,
                  ),
                  CustomTextField(
                    controller: controller.emailController,
                    labelText: AppString.email,
                    onSubmitted: (value) {
                      if (formKey.currentState!.validate()) {
                        controller.forgotPasswordController();
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppString.emailIsRequired;
                      } else if (!controller.emailRegexp
                          .hasMatch(controller.emailController.text)) {
                        return AppString.enterValidEmail;
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 74.h,
                  ),
                  controller.isLoading
                      ? const CustomElevatedLoadingButton()
                      : CustomButton(
                          titleText: AppString.next,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.forgotPasswordController();
                            }
                          },
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
