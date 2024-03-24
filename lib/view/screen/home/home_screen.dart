import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../widget/home_product_item.dart';
import '../../widget/navBar/navbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List quick = [
    {
      "image": AppIcons.burger,
      "title": AppString.burger,
    },
    {
      "image": AppIcons.event,
      "title": AppString.event,
    },
    {
      "image": AppIcons.iceCream,
      "title": AppString.iceCream,
    },
    {
      "image": AppIcons.coffee,
      "title": AppString.coffee,
    },
    {
      "image": AppIcons.garage,
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
    ScreenUtil.init(context);

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
                onTap: () => Get.toNamed(AppRoute.favorites),
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
              style: const TextStyle(color: AppColors.white50),
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
            Align(
                alignment: FractionalOffset.centerLeft,
                child: CustomText(
                  text: AppString.quick,
                  color: AppColors.white50,
                  fontSize: 20.sp,
                  top: 21.h,
                  fontWeight: FontWeight.w600,
                )),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero, // Add this line to remove bottom padding
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 50.h,
              ),
              itemCount: quick.length,
              itemBuilder: (context, index) {
                var item = quick[index];
                return GestureDetector(
                  onTap: () {
                    if(index ==1) {
                      Get.toNamed(AppRoute.eventList) ;
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.sp),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24.sp,
                          height: 24.sp,
                          margin: EdgeInsets.only(right: 12.w),
                          child: CustomImage(imageSrc: item['image']),
                        ),
                        Flexible(
                          child: CustomText(
                            text: item['title'],
                            maxLines: 1,
                            color: AppColors.white50,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppString.books,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: AppColors.white50,
                ),
                CustomText(
                  text: AppString.more,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.white50,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 190.sp,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 190.sp,
                    crossAxisSpacing: 34.w),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  var item = books[index];
                  return HomeProductItem(
                    image: item['image'],
                    title: item['title'],
                    subTitle: item['subTitle'],
                  );
                },
              ),
            ),
            SizedBox(
              height: 17.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppString.burgers,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: AppColors.white50,
                ),
                CustomText(
                  text: AppString.more,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColors.white50,
                ),
              ],
            ),
            SizedBox(
              height: 17.h,
            ),
            SizedBox(
              height: 190.sp,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 190.sp,
                    crossAxisSpacing: 34.w),
                itemCount: burgers.length,
                itemBuilder: (context, index) {
                  var item = burgers[index];
                  return HomeProductItem(
                    image: item['image'],
                    title: item['title'],
                    subTitle: item['subTitle'],
                  );
                },
              ),
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
