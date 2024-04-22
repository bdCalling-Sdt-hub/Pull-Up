import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class BoostBusiness extends StatelessWidget {
  BoostBusiness(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      this.subTitleTextSize = 10,
      this.background = AppColors.grey900,
      required this.onTap});

  final String title;
  final String subTitle;
  final String icon;
  final double subTitleTextSize;
  final Color background;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8),
        margin: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: background,
        ),
        child: Row(
          children: [
            CustomImage(imageSrc: icon),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    color: AppColors.white50,
                    left: 8.w,
                  ),
                  Expanded(
                    child: CustomText(
                      text: subTitle,
                      textAlign: TextAlign.start,
                      color: AppColors.white50,
                      fontSize: subTitleTextSize,
                      left: 8.w,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
