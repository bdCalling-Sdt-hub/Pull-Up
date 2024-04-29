import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';

import '../../../../utils/app_colors.dart';
import '../../../widget/text/custom_text.dart';

class FavoritesItem extends StatelessWidget {
  FavoritesItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    this.onTap,
  });

  final String title;

  final String subTitle;

  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          CustomImage(
            imageSrc: image,
            imageType: ImageType.decorationImage,
            height: 60.sp,
            width: 60.sp,
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  color: AppColors.white50,
                ),
                CustomText(
                  text: subTitle,
                  color: AppColors.white50,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  bottom: 4.h,
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.close,
                color: AppColors.primaryColor,
              ))
        ],
      ),
    );
  }
}
