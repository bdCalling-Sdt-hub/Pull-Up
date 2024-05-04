import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class AnotherShoppingListItem extends StatelessWidget {
  AnotherShoppingListItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  final String image;

  final String name;

  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      height: 110.sp,
      padding: EdgeInsets.all(8.sp),
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
          color: AppColors.white50, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          CustomImage(
            imageSrc: image,
            imageType: ImageType.decorationImage,
            height: 76.sp,
            width: 76.sp,
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  maxLines: 2,
                  fontWeight: FontWeight.w400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "\$${price}",
                      fontSize: 18,
                      maxLines: 1,
                      fontWeight: FontWeight.w600,
                    ),
                    Container(
                        width: 32.sp,
                        height: 32.sp,
                        decoration: BoxDecoration(
                            color: AppColors.grey300,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.primaryColor,
                        ))
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
