import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/auth/create_account_controller.dart';
import 'package:pull_up/utils/app_colors.dart';

import '../../../../../utils/app_string.dart';
import '../../../../widget/text/custom_text.dart';
import '../../../../widget/text_field/custom_text_field.dart';

class CreateAccountAllField extends StatelessWidget {
  CreateAccountAllField({super.key});

  CreateAccountController controller = Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: AppString.createAccount,
          fontSize: 24.sp,
          bottom: 23.h,
          color: AppColors.white50,
        ),
        CustomTextField(
          labelText: AppString.businessName,
          validator: (value) {
            if (value.isEmpty) {
              return AppString.enterYourBusinessName;
            } else {
              return null;
            }
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          labelText: AppString.email,
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
          labelText: AppString.phoneNumber,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return AppString.enterYourPhoneNumber;
            } else {
              return null;
            }
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          controller: controller.passwordController,
          labelText: AppString.password,
          isPassword: true,
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
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          labelText: AppString.confirmPassword,
          isPassword: true,
          validator: (value) {
            if (controller.passwordController.text != value) {
              return AppString.passwordDoseNotMatch;
            } else {
              return null;
            }
          },
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
