import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class UpcommingEventItem extends StatelessWidget {
  const UpcommingEventItem({
    super.key,
    required this.image,
    required this.name,
    required this.des,
    required this.location,
    required this.price,
    required this.joinNumber,
    required this.firstImage,
    required this.secondImage,
    required this.thirdImage,
  });

  final String image;
  final String firstImage;
  final String secondImage;
  final String thirdImage;
  final String name;
  final String des;
  final String joinNumber;
  final String location;
  final String price;

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
                      child: firstImage.isNotEmpty
                          ? CircleAvatar(
                              radius: 12.sp,
                              child: ClipOval(
                                child: CustomImage(
                                  imageSrc: "${AppUrl.imageUrl}/$firstImage",
                                  imageType: ImageType.network,
                                  width: 24.sp,
                                  height: 24.sp,
                                ),
                              ),
                            )
                          : const SizedBox()),
                  secondImage.isNotEmpty
                      ? Positioned(
                          left: 15,
                          child: CircleAvatar(
                              radius: 12.sp,
                              child: ClipOval(
                                child: CustomImage(
                                  imageSrc: "${AppUrl.imageUrl}/$secondImage",
                                  imageType: ImageType.network,
                                  height: 24.sp,
                                  width: 24.sp,
                                ),
                              )))
                      : const SizedBox(),
                  thirdImage.isNotEmpty
                      ? Positioned(
                          left: 0,
                          child: CircleAvatar(
                              radius: 12.sp,
                              child: ClipOval(
                                child: CustomImage(
                                  imageSrc: "${AppUrl.imageUrl}/$thirdImage",
                                  imageType: ImageType.network,
                                  width: 24.sp,
                                  height: 24.sp,
                                ),
                              )))
                      : const SizedBox()
                ],
              ),
              SizedBox(
                width: 8.w,
              ),
              joinNumber != "0"
                  ? CustomText(
                      text: "+$joinNumber",
                      fontSize: 12.w,
                      fontWeight: FontWeight.w300,
                      color: AppColors.deepOrange,
                    )
                  : const SizedBox()
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
