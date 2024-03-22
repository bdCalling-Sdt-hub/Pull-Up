import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({
    super.key,
    required this.title,
    required this.image,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        color: AppColors.grey900,
      ),
      child: Row(
        children: [
          SizedBox(width: 18.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: title,
                color: AppColors.white50,
                left: 8.w,
                bottom: 6.h,
              ),
              CustomText(
                text: subTitle,
                color: AppColors.white50,
                left: 8.w,
              ),
            ],
          ),
          const Spacer(),
          CustomImage(
            imageSrc: image,
            imageType: ImageType.png,
            size: 60,
          )
        ],
      ),
    );
  }
}
