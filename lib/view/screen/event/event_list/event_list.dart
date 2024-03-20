

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/custom_image.dart';
import '../../../widget/home_product_item.dart';
import '../../../widget/navBar/navbar.dart';
import '../../../widget/text/custom_text.dart';
import 'inner_widget/recommendation_list_item.dart';
import 'inner_widget/upcomming_event_item.dart';

class EventListScreen extends StatelessWidget {
  EventListScreen({super.key});

  List quick = [
    {
      "image":AppIcons.burger,
      "title": AppString.burger,
    },
    {
      "image": AppIcons.event,
      "title": AppString.event,
    },
    {
      "image":AppIcons.iceCream,
      "title": AppString.iceCream,
    },
    {
      "image": AppIcons.coffee,
      "title": AppString.coffee,
    },
    {
      "image":AppIcons.garage,
      "title": AppString.garage,
    },
    {
      "image": AppIcons.dj,
      "title": AppString.dj,
    },
  ];
  List books = [
    {
      "image": AppImages.thinkingFast,
      "title": AppString.thinkingFast,
      "subTitle": AppString.charleyStore
    },
    {
      "image": AppImages.milkAndHoney,
      "title": AppString.milkAndHoney,
      "subTitle": AppString.generalStore
    },
  ];

  List burgers = [
    {
      "image": AppImages.burger,
      "title": AppString.burger,
      "subTitle": AppString.charleyStore
    },
    {
      "image": AppImages.burgers,
      "title": AppString.burgers,
      "subTitle": AppString.generalStore
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: CustomText(
          text: AppString.weJustKnowThePlace,
          color: AppColors.white50,
          textAlign: TextAlign.start,
          fontSize: 24.sp,
        ),
        actions: [
          Row(
            children: [
              GestureDetector(
                  onTap: () => Get.toNamed(AppRoute.changeLocation),
                  child: CustomImage(imageSrc: AppIcons.location)),
              SizedBox(
                width: 8.w,
              ),
              GestureDetector(
                child: const Icon(
                  Icons.favorite,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: 28.w,
              )
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            TextFormField(
              cursorColor: AppColors.white50,
              decoration: InputDecoration(
                hintText: AppString.searchForKeywords,
                hintStyle: const TextStyle(color: AppColors.white50),
                contentPadding:
                EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                suffixIcon: const Icon(
                  Icons.search_sharp,
                  color: AppColors.white50,
                ),
                border: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: AppColors.white50, width: 1.w),
                    borderRadius: BorderRadius.circular(10.r)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: AppColors.white50, width: 1.w),
                    borderRadius: BorderRadius.circular(10.r)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppString.quick,
                  color: AppColors.white50,
                  fontSize: 20.sp,
                  top: 21.h,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: AppString.seeAll,
                  color: AppColors.white50,
                  fontSize: 14.sp,
                  top: 21.h,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(
                height: 255.h,
                child:ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.toNamed(AppRoute.eventInfo),
                        
                        child: const UpcommingEventItem()) ;
                  },)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppString.recommendations,
                  color: AppColors.white50,
                  fontSize: 20.sp,
                  top: 8.h,
                  bottom: 8.h,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: AppString.seeAll,
                  color: AppColors.white50,
                  fontSize: 14.sp,
                  top: 8.h,
                  bottom: 8.h,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
            SizedBox(
              height: 300,
              width: Get.height,
              child: ListView.builder(
                itemCount: 10,

                itemBuilder: (context, index) {
                  return RecommendationsListItem(
                    image: AppImages.seminar2,
                    title: AppString.elevateTheConferenceForProfessionalGrowth,
                    price: "30.00",
                  ) ;
                },),
            ),

          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0,),
    );
  }
}
