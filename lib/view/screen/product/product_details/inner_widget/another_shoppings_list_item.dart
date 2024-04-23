import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class AnotherShoppingListItem extends StatelessWidget {
  const AnotherShoppingListItem({super.key});

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
          Container(
            height: 76.sp,
            width: 76.sp,
            margin: EdgeInsets.only(right: 18.w),
            decoration: ShapeDecoration(
              color: AppColors.white50,
              image: const DecorationImage(
                  image: AssetImage(AppImages.book), fit: BoxFit.fill),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
            ),
          ),

          Expanded(
            child: Column(
              children: [
                const CustomText(
                  text: AppString.familyFriendsLoveBook,
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: "\$43", fontSize: 18, fontWeight: FontWeight.w600,),
                    Container(
                      width: 32.sp,
                      height: 32.sp,
                      decoration: BoxDecoration(
                        color: AppColors.grey300,
                        borderRadius: BorderRadius.circular(10.r)
                      ),
                        child: const Icon(Icons.add, color: AppColors.primaryColor,))
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
