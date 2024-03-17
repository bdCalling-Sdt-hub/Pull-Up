import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class LocatedGridviewItem extends StatelessWidget {
  LocatedGridviewItem({
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
    return GestureDetector(
      onTap: () =>  Get.toNamed(AppRoute.shopHouse),
      child: Container(
        height: 160.h,
        decoration: BoxDecoration(
          color: AppColors.white50,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 150.w,
                height: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    )),
                // child: CustomImage(imageSrc: AppImages.thinkingFast, imageType: ImageType.png, size: 150.sp,)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CustomText(
                      text: title,
                      color: AppColors.grey900,
                      left: 4.h,
                      maxLines: 1,
                      top: 8.h,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  CustomText(
                    text: "\$3.50",
                    color: AppColors.primaryColor,
                    left: 4.h,
                    top: 8.h,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: CustomText(
                      text: subTitle,
                      color: AppColors.grey900,
                      left: 4.h,
                      top: 4.h,
                      maxLines: 1,
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp,
                    ),
                  ),
                  CustomText(
                    text: "(Pick Up)",
                    color: AppColors.primaryColor,
                    left: 4.h,
                    top: 4.h,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp,
                  ),
                  const Icon(Icons.arrow_circle_right_outlined)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
