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
import 'package:pull_up/view/widget/text_field/custom_text_field.dart';

import '../../../widget/appbar_icon/appbar_icon.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool isCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            const CreateAccountAllField(),
            Row(
              children: [
                Checkbox(
                    value: isCheckbox,
                    shape:
                        const CircleBorder(side: BorderSide(color: Colors.red)),
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
                      color: AppColors.secondary,
                ))
              ],
            ),
            SizedBox(height: 55.h,),
            CustomButton(titleText: AppString.create, onPressed: () => Get.toNamed (AppRoute.emailVerify),),
            SizedBox(height: 25.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: AppString.alreadyHaveAccount,
                  color: AppColors.secondary,
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
