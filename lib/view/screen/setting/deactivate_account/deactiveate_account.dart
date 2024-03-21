import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';
import 'package:pull_up/view/widget/text_field/custom_text_field.dart';

class DeactiveateAccount extends StatelessWidget {
  DeactiveateAccount({super.key});

  List<String> options = [
    AppString.takingBreak,
    AppString.privacyConcerns,
    AppString.accountSecurity,
    AppString.lackOfInterest,
    AppString.personalReasons,
    AppString.other
  ];
  RxString currentOption = "".obs;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.deactivateAccount,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.sadToSeeYouGo,
              color: AppColors.white50,
              bottom: 30.h,
              left: 30.w,
            ),
            CustomText(
              text: AppString.selectTheOption,
              color: AppColors.white50,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
              bottom: 18.h,
            ),
            Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    options.length,
                    (index) => InkWell(
                      onTap: () {
                        currentOption.value = options[index];
                      },
                      child: Row(
                        children: [
                          Radio<String>(
                            activeColor: AppColors.primaryColor,
                            fillColor: currentOption.value == options[index]
                                ? null
                                : MaterialStateProperty.all(AppColors.white50),
                            value: options[index],
                            groupValue: currentOption.value,
                            onChanged: (value) {
                              currentOption.value = options[index];
                            },
                          ),
                          CustomText(
                            text: options[index],
                            fontSize: 18.sp,
                            color: AppColors.white50,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            CustomText(
              text: AppString.enterYourPassword,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white50,
              bottom: 8.h,
            ),
            const CustomTextField(
              borderColor: AppColors.white50,
              fillColor: AppColors.background,
              hintText: AppString.enterYourPassword,


            ),
            SizedBox(height: 28.h,),
            CustomButton(titleText: AppString.deactivateYourAccount, onPressed: () => Get.back(),)
          ],
        ),
      ),
    );
  }
}
