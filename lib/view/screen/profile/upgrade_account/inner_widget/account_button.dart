import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class AccountButton extends StatelessWidget {
  AccountButton({
    super.key,
    required this.title,
    this.color = Colors.transparent,
    this.onTap
  });

  final String title;
  final Color color;
  final VoidCallback? onTap ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: AppColors.white50)),
        child: CustomText(
          text: title,
          fontSize: 8,
          maxLines: 2,
          color: AppColors.white50,
        ),
      ),
    );
  }
}
