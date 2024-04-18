import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/custom_loading.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../../controller/auth/login_controller.dart';
import '../../../widget/text_field/custom_text_field.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
      ),
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Form(
              key: formKey,
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
                  CustomTextField(
                    labelText: AppString.emailOrUsername,
                    controller: controller.emailController,
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
                    height: 20.h,
                  ),
                  CustomTextField(
                    labelText: AppString.password,
                    controller: controller.passwordController,
                    isPassword: true,
                    onSubmitted: (p0) {
                      if (formKey.currentState!.validate()) {
                        controller.logInRepo();
                      }
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppString.fieldCaNotBeEmpty;
                      } else if (value.length < 8) {
                        return AppString.passwordValidator;
                      } else if (!controller.passRegExp.hasMatch(value)) {
                        return AppString.passwordValidator;
                      } else {
                        return null;
                      }
                    },
                  ),
                  Align(
                      alignment: FractionalOffset.centerRight,
                      child: GestureDetector(
                        onTap: () =>
                            Get.toNamed(AppRoute.forgetPasswordCheckEmail),
                        child: CustomText(
                          text: AppString.forgotPassword,
                          color: AppColors.white50,
                          top: 16.h,
                          bottom: 23.h,
                        ),
                      )),
                  controller.isLoading
                      ? const CustomElevatedLoadingButton()
                      : CustomButton(
                          titleText: AppString.login,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller.logInRepo();
                            }
                          },
                        ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: AppString.doNotHaveAccount,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      GestureDetector(
                        onTap: () => Get.offAllNamed(AppRoute.createAccount),
                        child: const CustomText(
                          text: AppString.registerNow,
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
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
