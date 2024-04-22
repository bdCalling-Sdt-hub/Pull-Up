import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class Item extends StatelessWidget {
  Item(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  final String title;

  final String icon;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.sp),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.grey900,
        ),
        child: Row(
          children: [
            CustomImage(imageSrc: icon),
            CustomText(
              text: title,
              color: AppColors.white50,
              left: 8.w,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.white50,
            )
          ],
        ),
      ),
    );
  }
}
