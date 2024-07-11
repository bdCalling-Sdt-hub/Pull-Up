import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class HomeProductItem extends StatelessWidget {
  HomeProductItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.isFavorite,
      this.showFavorite = true,
      this.onTap});

  final String image;

  final String title;

  final String subTitle;
  final bool isFavorite;
  final bool showFavorite;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Container(
      margin: EdgeInsets.only(right: 12.w),
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
                Center(
                  child: CustomImage(
                    imageSrc: image,
                    height: 100.h,
                    imageType: ImageType.decorationImage,
                  ),
                ),
                showFavorite
                    ? Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: onTap,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor:
                                AppColors.secondary.withOpacity(0.30),
                            child: ClipOval(
                              child: isFavorite
                                  ? Icon(
                                      Icons.favorite,
                                      size: 16.sp,
                                      color: AppColors.primaryColor,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      size: 16.sp,
                                      color: AppColors.primaryColor,
                                    ),
                            ),
                          ),
                        ))
                    : const SizedBox()
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
              maxLines: 1,
              fontWeight: FontWeight.w700,
              fontSize: 10.sp,
            )
          ],
        ),
      ),
    );
  }
}
