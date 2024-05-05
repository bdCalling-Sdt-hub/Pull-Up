import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/event/event_details_controller.dart';
import 'package:pull_up/utils/app_url.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../widget/image/custom_image.dart';
import '../../../../widget/text/custom_text.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventDetailsController>(
      builder: (controller) {
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
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: controller.formatDate(
                            controller.eventDetailsModel?.data?.dateTime != null
                                ? controller.eventDetailsModel!.data!.dateTime!
                                : ""),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        maxLines: 1,
                        color: AppColors.white50,
                      ),
                      CustomText(
                        text:
                            '${controller.getDayName(controller.eventDetailsModel?.data?.dateTime != null ? controller.eventDetailsModel!.data!.dateTime! : "")}, ${controller.eventDetailsModel?.data?.dateTime != null ? "${controller.eventDetailsModel!.data!.dateTime!.split("T")[1].split(":")[0]}${":"}${controller.eventDetailsModel!.data!.dateTime!.split("T")[1].split(":")[1]}" : ""}',
                        color: AppColors.yellow200,
                      )
                    ],
                  ),
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
                    CustomText(
                      text: controller.eventDetailsModel?.data?.location ?? "",
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
                CircleAvatar(
                  radius: 30.sp,
                  child: ClipOval(
                    child: CustomImage(
                      imageSrc:
                          "${AppUrl.imageUrl}/${controller.eventDetailsModel?.data?.image?.path ?? ""}",
                      height: 60.sp,
                      width: 60.sp,
                      imageType: ImageType.network,
                    ),
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
      },
    );
  }
}
