import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/auth/create_account_controller.dart';
import 'package:pull_up/helper/reg_exp_helper.dart';
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
          labelText: AppString.name,
          controller: controller.nameController,
          validator: (value) {
            if (value.isEmpty) {
              return AppString.thisFieldIsRequired;
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
          controller: controller.emailController,
          validator: (value) {
            if (value!.isEmpty) {
              return AppString.thisFieldIsRequired;
            } else if (!RegExpHelper.emailRegexp
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
          controller: controller.numberController,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty) {
              return AppString.thisFieldIsRequired;
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
          height: 20.h,
        ),
        CustomTextField(
          labelText: AppString.confirmPassword,
          controller: controller.confirmControllerController,
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
