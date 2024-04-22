

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../widget/image/custom_image.dart';
import '../../../../widget/text/custom_text.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            Container(
              padding: EdgeInsets.all(11.sp),
              decoration: BoxDecoration(
                  color: AppColors.deepOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r)),
              child: CustomImage(
                imageSrc: AppIcons.dataTime,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "10 December, 2023",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white50,
                ),
                const CustomText(
                  text: 'Tuesday, 4:00PM - 9:00PM',
                  color: AppColors.yellow200,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(11.sp),
              decoration: BoxDecoration(
                  color: AppColors.deepOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r)),
              child: CustomImage(
                imageSrc: AppIcons.eventLocation,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Gala Convention Center',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white50,
                ),
                const CustomText(
                  text: '36 Guild Street London, USA ',
                  color: AppColors.yellow200,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.deepOrange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.r)),
              child: CustomImage(
                imageSrc: AppImages.profile2,
                imageType: ImageType.png,
                size: 60.sp,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Ashfak Sayem',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white50,
                ),
                const CustomText(
                  text: 'Organizer',
                  color: AppColors.yellow300,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
