import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class SubscriptionActivate extends StatelessWidget {
  SubscriptionActivate({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  final controller = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:  16.sp, horizontal: 8.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: AppColors.primaryColor,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                color: AppColors.white50,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                left: 8.w,
              ),
              CustomText(
                text: subTitle,
                color: AppColors.white50,
                left: 8.w,
              ),
            ],
          ),
          const Spacer(),
          AdvancedSwitch(
            height: 14.h,
            width: 28.w,
            activeColor: AppColors.grey300,
            controller: controller,
          )
        ],
      ),
    );
  }
}
