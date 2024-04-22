import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';

import '../../../../utils/app_colors.dart';
import '../../../widget/text/custom_text.dart';

class FavoritesItem extends StatefulWidget {
  FavoritesItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String title;

  final String subTitle;

  final String image;

  @override
  State<FavoritesItem> createState() => _FavoritesItemState();
}

class _FavoritesItemState extends State<FavoritesItem> {
  bool isFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          CustomImage(imageSrc: widget.image,imageType: ImageType.png, size: 60.sp,),
          SizedBox(width: 12.w,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: widget.title,
                  color: AppColors.white50,
                ),
                CustomText(
                  text: widget.subTitle,
                  color: AppColors.white50,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  bottom: 4.h,
                ),
                Row(
                  children: [
                    Container(
                      width: 3.sp,
                      height: 3.sp,
                      color: AppColors.primaryColor,
                    ),
                    CustomText(
                      text: '4.6Km Distance',
                      left: 4.w,
                      right: 8.w,
                      color: AppColors.white50,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      bottom: 4.h,
                    ),
                    Container(
                      width: 3.sp,
                      height: 3.sp,
                      color: AppColors.primaryColor,
                    ),
                    Flexible(
                      child: CustomText(
                        text: 'Delivery in 15 min',
                        left: 4.w,
                        color: AppColors.white50,
                        fontWeight: FontWeight.w300,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        bottom: 4.h,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(
              onPressed: () {
                if (isFavorites) {
                  isFavorites = false;
                } else {
                  isFavorites = true;
                }
                setState(() {});
              },
              icon: isFavorites
                  ? const Icon(
                      Icons.favorite,
                      color: AppColors.primaryColor,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: AppColors.primaryColor,
                    ))
        ],
      ),
    );
  }
}
