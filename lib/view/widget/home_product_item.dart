import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class HomeProductItem extends StatelessWidget {
  HomeProductItem({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image;

  final String title;

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(4.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: 135.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.fill,
                      )),
                  // child: CustomImage(imageSrc: AppImages.thinkingFast, imageType: ImageType.png, size: 150.sp,)
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.secondary.withOpacity(0.30),
                      child: ClipOval(
                        child: Icon(
                          Icons.favorite_border,
                          size: 16.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ))
              ],
            ),
            CustomText(
              text: title,
              color: AppColors.white50,
              left: 4.h,
              top: 8.h,
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              text: subTitle,
              color: AppColors.white50,
              left: 4.h,
              top: 4.h,
              fontWeight: FontWeight.w700,
              fontSize: 10.sp,
            )
          ],
        ),
      ),
    );
  }
}
