import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../../../utils/app_string.dart';

class RecommendationsListItem extends StatelessWidget {
  RecommendationsListItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  String image;

  String title;

  String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.sp),
      margin: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.white50,
      ),
      child: Row(
        children: [
          CustomImage(
            imageSrc: image,
            imageType: ImageType.decorationImage,
            width: 84.sp,
            height: 84.sp,
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomImage(imageSrc: AppIcons.eventListLocation),
                        SizedBox(
                          width: 4.w,
                        ),
                        const CustomText(text: AppString.losAngeles)
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                          color: AppColors.grey500,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: CustomText(
                        text: "\$$price",
                        color: AppColors.white50,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
