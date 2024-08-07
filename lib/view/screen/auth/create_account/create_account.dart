import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/screen/auth/create_account/inner_widget/create_account_all_field.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../../controller/auth/create_account_controller.dart';
import '../../../../utils/app_utils.dart';
import '../../../widget/appbar_icon/appbar_icon.dart';
import '../../../widget/custom_loading.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isCheckbox = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
      ),
      body: GetBuilder<CreateAccountController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CreateAccountAllField(),
                  Row(
                    children: [
                      Checkbox(
                          value: isCheckbox,
                          activeColor: AppColors.transparent,
                          checkColor: AppColors.primaryColor,
                          onChanged: (value) {
                            isCheckbox = value!;
                            setState(() {});
                          }),
                      const Expanded(
                          child: CustomText(
                        text: AppString.termsAndPolicy,
                        textAlign: TextAlign.start,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                  controller.isLoading
                      ? const CustomElevatedLoadingButton()
                      : CustomButton(
                          titleText: AppString.create,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (isCheckbox) {
                                controller.createUserRepo();
                              } else {
                                Utils.snackBarMessage(
                                    AppString.termsAndCondition,
                                    AppString.pleaseAgreeToTermsAndCondition);
                              }
                            }
                          }),
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: AppString.alreadyHaveAccount,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoute.login);
                        },
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
        },
      ),
    );
  }
}
