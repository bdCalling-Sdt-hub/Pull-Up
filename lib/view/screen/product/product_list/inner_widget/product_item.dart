import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/view/screen/product/product_list/inner_widget/delete_popup.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../widget/text/custom_text.dart';

class ProductItem extends StatefulWidget {
  ProductItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.price,
  });

  final String title;

  final String subTitle;

  final String image;
  final String price;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
          color: AppColors.grey300, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          CustomImage(
              imageSrc: widget.image,
              width: 90.sp,
              height: 90.sp,
              imageType: ImageType.decorationImage),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: widget.title,
                  color: AppColors.white50,
                  fontWeight: FontWeight.w600,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
                CustomText(
                  text: widget.subTitle,
                  color: AppColors.white50,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  bottom: 4.h,
                ),
                CustomText(
                  text: "\$ ${widget.price}",
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  bottom: 4.h,
                ),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios, color: AppColors.primaryColor,),
          SizedBox(width: 10.w,)

          // IconButton(
          //     onPressed: () {
          //       // DeleteItemPopUp.itemDeletePopUp();
          //     },
          //     icon: CustomImage(
          //       imageSrc: AppIcons.delete,
          //     ))
        ],
      ),
    );
  }
}
