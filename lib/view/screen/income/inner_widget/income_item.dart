import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors.dart';
import '../../../widget/image/custom_image.dart';
import '../../../widget/text/custom_text.dart';

class IncomeItem extends StatelessWidget {
  IncomeItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.amount,
  });

  final String title;

  final String subTitle;

  final String image;
  final num amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white50, borderRadius: BorderRadius.circular(10.r)),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      margin: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.transparent,
              child: ClipOval(
                  child: CustomImage(
                imageSrc: image,
                imageType: ImageType.png,
                height: 40,
                width: 40,
              ))),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  color: AppColors.grey900,
                ),
                CustomText(
                  text: subTitle,
                  color: AppColors.grey900,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                )
              ],
            ),
          ),
          CustomText(
            text: "+\$${amount/100}",
            fontSize: 12.sp,
            color: AppColors.deepOrange,
            fontWeight: FontWeight.w700,
            right: 16.w,
          )
        ],
      ),
    );
  }
}
