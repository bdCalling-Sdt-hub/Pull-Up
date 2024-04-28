import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pull_up/controller/auth/create_account_controller.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';

import '../../../../utils/app_colors.dart';
import '../../../widget/button/custom_button.dart';
import '../../../widget/custom_loading.dart';
import '../../../widget/text/custom_text.dart';

class EmailVerify extends StatefulWidget {
  EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  final formKey = GlobalKey<FormState>();

  CreateAccountController controller = Get.put(CreateAccountController());

  String email = Get.parameters['email'] ?? '';

  @override
  void initState() {
    if (email.isNotEmpty) {
      controller.emailController.text = email;
      controller.resendOtp();
      print(email);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: const AppbarIcon(),
        ),
        body: GetBuilder<CreateAccountController>(
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
                      width: 170.sp,
                      height: 170.sp,
                    ),
                    CustomText(
                      text: AppString.checkEmailForVerifyPin,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      bottom: 96.h,
                      top: 60.h,
                    ),
                    Flexible(
                      flex: 0,
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        cursorColor: AppColors.white50,
                        controller: controller.otpController,
                        textStyle: const TextStyle(color: AppColors.white50),
                        appContext: (context),
                        validator: (value) {
                          if (value!.length < 5) {
                            return "Please enter the OTP code.".tr;
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
                        enableActiveFill: true,
                      ),
                    ),
                    InkWell(
                        onTap: () => controller.resendOtp(),
                        child: const CustomText(text: AppString.resendCode)),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: controller.isLoadingVerify
                          ? const CustomElevatedLoadingButton()
                          : CustomButton(
                              titleText: AppString.next,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  controller.verifyEmailRepo();
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
