import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../../../utils/app_images.dart';
import '../../../../../utils/app_string.dart';

class UpcommingEventItem extends StatelessWidget {
  UpcommingEventItem({
    super.key,
    required this.image,
    required this.name,
    required this.des,
    required this.location,
    required this.price,
  });

  String image;

  String name;

  String des;

  String location;

  String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.w),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.white50,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              CustomImage(
                imageSrc: image,
                imageType: ImageType.decorationImage,
                height: 130.h,
                width: 220.w,
              ),
              // Container(
              //   height: 130.h,
              //   width: 220.w,
              //   decoration: ShapeDecoration(
              //     color: AppColors.white50,
              //     image: const DecorationImage(
              //         image: AssetImage(AppImages.seminar), fit: BoxFit.fill),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(10.r)),
              //     ),
              //   ),
              // ),
            ],
          ),
          CustomText(
            text: name,
            color: AppColors.grey900,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 30.w),
                      child: CustomImage(
                        imageSrc: AppImages.profile1,
                        imageType: ImageType.png,
                        width: 24.sp,
                        height: 24.sp,
                      )),
                  Positioned(
                      left: 15,
                      child: CustomImage(
                        imageSrc: AppImages.profile2,
                        imageType: ImageType.png,
                        height: 24.sp,
                        width: 24.sp,
                      )),
                  Positioned(
                      left: 0,
                      child: CustomImage(
                        imageSrc: AppImages.profile1,
                        imageType: ImageType.png,
                        width: 24.sp,
                        height: 24.sp,
                      ))
                ],
              ),
              SizedBox(
                width: 8.w,
              ),
              CustomText(
                text: "+30 Going",
                fontSize: 12.w,
                fontWeight: FontWeight.w300,
                color: AppColors.deepOrange,
              )
            ],
          ),
          SizedBox(
            height: 8.w,
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.location_pin),
                CustomText(
                  text: location,
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
