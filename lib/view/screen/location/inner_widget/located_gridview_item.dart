import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class LocatedGridviewItem extends StatelessWidget {
  const LocatedGridviewItem({
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
    return Container(
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
            CustomImage(
              imageSrc: image,
              imageType: ImageType.decorationImage,
              height: 110.h,
              width: 150.w,
            ),
            // Container(
            //   width: 150.w,
            //   height: 100.h,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10.r),
            //       image: DecorationImage(
            //         image: AssetImage(image),
            //         fit: BoxFit.fill,
            //       )),
            //   // child: CustomImage(imageSrc: AppImages.thinkingFast, imageType: ImageType.png, size: 150.sp,)
            // ),
            CustomText(
              text: title,
              color: AppColors.grey900,
              left: 4.h,
              maxLines: 1,
              fontWeight: FontWeight.w700,
            ),
            CustomText(
              text: subTitle,
              color: AppColors.grey900,
              left: 4.h,
              maxLines: 1,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
