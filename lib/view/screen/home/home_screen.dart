import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/home_controller.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../model/product_model.dart';
import '../../widget/home_product_item.dart';
import '../../widget/navBar/navbar.dart';
import '../../widget/no_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List quick = [
  //   {
  //     "image": AppIcons.burger,
  //     "title": AppString.burger,
  //   },
  //   {
  //     "image": AppIcons.event,
  //     "title": AppString.event,
  //   },
  //   {
  //     "image": AppIcons.iceCream,
  //     "title": AppString.iceCream,
  //   },
  //   {
  //     "image": AppIcons.coffee,
  //     "title": AppString.coffee,
  //   },
  //   {
  //     "image": AppIcons.garage,
  //     "title": AppString.garage,
  //   },
  //   {
  //     "image": AppIcons.dj,
  //     "title": AppString.dj,
  //   },
  // ];

  // List books = [
  // List burgers = [
  //   {
  //     "image": AppImages.burger,
  //     "title": AppString.burger,
  //     "subTitle": AppString.charleyStore
  //   },
  //   {
  //     "image": AppImages.burgers,
  //     "title": AppString.burgers,
  //     "subTitle": AppString.generalStore
  //   },
  // ];

  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.bookRepo();
    controller.burgerRepo();
    controller.keywordRepo();
    controller.burgerPage = 1;
    controller.bookPage = 1;
    controller.burgerScrollController.addListener(() {
      controller.burgerScrollControllerCall();
    });
    controller.bookScrollController.addListener(() {
      controller.bookScrollControllerCall();
    });
  }

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
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
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
                controller.keywords.isEmpty
                    ? const SizedBox()
                    : Align(
                        alignment: FractionalOffset.centerLeft,
                        child: CustomText(
                          text: AppString.quick,
                          color: AppColors.white50,
                          fontSize: 20.sp,
                          top: 21.h,
                          fontWeight: FontWeight.w600,
                        )),
                switch (controller.keywordStatus) {
                  Status.loading =>
                    const Center(child: CircularProgressIndicator()),
                  Status.error => ErrorScreen(
                      onTap: () => controller.keywordRepo(),
                    ),
                  Status.completed => controller.keywords.isEmpty
                      ? const SizedBox()
                      : GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          // Add this line to remove bottom padding
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 40.h,
                          ),
                          itemCount: controller.keywords.length,
                          itemBuilder: (context, index) {
                            var item = controller.keywords[index];
                            return GestureDetector(
                              onTap: () {
                                if (item == "event") {
                                  Get.toNamed(AppRoute.eventList);
                                } else {
                                  Get.toNamed(AppRoute.productList,
                                      parameters: {
                                        "account": "shopping",
                                        "keyword": item.keyword
                                      });
                                }
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(right: 8.w, bottom: 8.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Container(
                                    //   width: 24.sp,
                                    //   height: 24.sp,
                                    //   margin: EdgeInsets.only(right: 4.w),
                                    //   child:
                                    //       CustomImage(imageSrc: item['image']),
                                    // ),
                                    Flexible(
                                      child: CustomText(
                                        text: item.keyword,
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
                },
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppString.books,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: AppColors.white50,
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(AppRoute.productList,
                          parameters: {
                            "account": "shopping",
                            "keyword": "Book"
                          }),
                      child: CustomText(
                        text: AppString.more,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.white50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                    height: 190.sp,
                    child: switch (controller.bookStatus) {
                      Status.loading =>
                        const Center(child: CircularProgressIndicator()),
                      Status.error => ErrorScreen(
                          onTap: () {
                            controller.bookPage = 1;
                            controller.bookRepo();
                          },
                        ),
                      Status.completed => controller.books.isEmpty
                          ? const NoData()
                          : GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              controller: controller.bookScrollController,
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      mainAxisExtent: 160.sp,
                                      crossAxisSpacing: 20.w),
                              itemCount: controller.books.length,
                              itemBuilder: (context, index) {
                                Result item = controller.books[index];
                                return InkWell(
                                  onTap: () => Get.toNamed(
                                      AppRoute.productDetails,
                                      parameters: {"productId": item.sId!}),
                                  child: HomeProductItem(
                                    image:
                                        "${AppUrl.imageUrl}/${item.image?.path}",
                                    title: item.name ?? "",
                                    subTitle: item.description ?? "",
                                  ),
                                );
                              },
                            ),
                    }),
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
                    InkWell(
                      onTap: () => Get.toNamed(AppRoute.productList,
                          parameters: {
                            "account": "shopping",
                            "keyword": "Burger"
                          }),
                      child: CustomText(
                        text: AppString.more,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.white50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17.h,
                ),
                SizedBox(
                  height: 190.sp,
                  child: switch (controller.burgerStatus) {
                    Status.loading =>
                      const Center(child: CircularProgressIndicator()),
                    Status.error => ErrorScreen(onTap: () {
                        controller.burgerPage = 1;
                        controller.burgerRepo();
                      }),
                    Status.completed => controller.burgers.isEmpty
                        ? const NoData()
                        : GridView.builder(
                            controller: controller.burgerScrollController,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    mainAxisExtent: 160.sp,
                                    crossAxisSpacing: 20.w),
                            itemCount: controller.burgers.length,
                            itemBuilder: (context, index) {
                              Result item = controller.burgers[index];
                              return InkWell(
                                onTap: () => Get.toNamed(
                                    AppRoute.productDetails,
                                    parameters: {"productId": item.sId!}),
                                child: HomeProductItem(
                                  image:
                                      "${AppUrl.imageUrl}/${item.image?.path}",
                                  title: item.name ?? "",
                                  subTitle: item.description ?? "",
                                ),
                              );
                            },
                          ),
                  },
                ),
                SizedBox(
                  height: 50.h,
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
