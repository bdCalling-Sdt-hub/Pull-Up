import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../widget/home_product_item.dart';

class ShopHouseScreen extends StatelessWidget {
  ShopHouseScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 340.h,
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
              color: AppColors.white50,
              image: const DecorationImage(
                  image: AssetImage(AppImages.bookHouse), fit: BoxFit.fill),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
            ),
          ),
          Container(
            width: Get.height,
            height: Get.height,
            margin: EdgeInsets.only(top: 270.h),
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),

            decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r))),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                            size: 18.sp,
                          ),
                          SizedBox(width: 4.w),
                          const CustomText(
                            text: "4.9",
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                      CustomText(
                        text: AppString.theBookHouse,
                        color: AppColors.white50,
                        fontSize: 20.sp,
                      ),
                      CustomText(
                        text: AppString.giveRating,
                        color: AppColors.primaryColor,
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                  Align(
                      alignment: FractionalOffset.centerLeft,
                      child: CustomText(
                        text: AppString.description,
                        fontSize: 20.sp,
                        color: AppColors.white50,
                        fontWeight: FontWeight.w600,
                        top: 24.h,
                      )),
                  CustomText(
                    text:
                        "McDonald's is known for its popular breakfast menu, which includes items such as Egg McMuffins and hotcakes .It is known for its signature menu items such as the Big Mac, Quarter Pounder, and McNuggets, as well as its iconic golden arches logo. Read More",
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                    color: AppColors.white50,
                    bottom: 13.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.call,
                            size: 16.sp,
                            color: AppColors.white50,
                          ),
                          CustomText(
                            text: "+92 12235 48231",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: AppColors.white50,
                            left: 8.w,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mail_outline_rounded,
                            size: 16.sp,
                            color: AppColors.white50,
                          ),
                          CustomText(
                            text: "xyz@yahoo.com",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: AppColors.white50,
                            left: 8.w,
                          )
                        ],
                      ),
                    ],
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 190.sp,
                        crossAxisSpacing: 34.w,
                        mainAxisSpacing: 24.h),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      var item = books[index];
                      return GestureDetector(
                        onTap: () =>  Get.toNamed(AppRoute.productDetails),
                        child: HomeProductItem(
                          image: item['image'],
                          title: item['title'],
                          subTitle: item['subTitle'],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
