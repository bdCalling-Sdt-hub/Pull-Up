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
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/widget/custom_loader.dart';
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


  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.burgerPage = 1;
    controller.bookPage = 1;
    controller.eventPage = 1;

    controller.bookRepo();
    controller.burgerRepo();
    controller.keywordRepo();
    controller.eventRepo();

    controller.burgerScrollController.addListener(() {
      controller.burgerScrollControllerCall();
    });
    controller.bookScrollController.addListener(() {
      controller.bookScrollControllerCall();
    });
    controller.eventScrollController.addListener(() {
      controller.eventScrollControllerCall();
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    controller.updateKeyboardVisibility();

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
                onTap: () async {
                  var result = await Get.toNamed(AppRoute.favorites);
                  controller.burgerPage = 1;
                  controller.bookPage = 1;
                  controller.eventPage = 1;

                  controller.bookRepo();
                  controller.burgerRepo();
                  controller.keywordRepo();
                  controller.eventRepo();
                },
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
                  controller: controller.searchController,
                  style: const TextStyle(color: AppColors.white50),
                  onTap: () => controller.isSearch = true,
                  onFieldSubmitted: (value) {
                    controller.isSearch = false;
                    Get.toNamed(AppRoute.productList, parameters: {
                      "account": "shopping",
                      "keyword": controller.searchController.text
                    });
                  },
                  onChanged: (value) {
                    controller.changeSearchKeyword(value);
                  },
                  decoration: InputDecoration(
                    hintText: AppString.searchForKeywords,
                    hintStyle: const TextStyle(color: AppColors.white50),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.productList, parameters: {
                          "account": "shopping",
                          "keyword": controller.searchController.text
                        });
                      },
                      child: const Icon(
                        Icons.search_sharp,
                        color: AppColors.white50,
                      ),
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
                controller.isSearch
                    ? SizedBox(
                        height: Get.height * 0.9,
                        child: Padding(
                          padding: EdgeInsets.only(top: 12.h),
                          child: ListView.builder(
                            itemCount: controller.keywords.length,
                            itemBuilder: (context, index) {
                              String item =
                                  controller.keywords[index].keyword ?? "";

                              if (controller.searchController.text.isEmpty) {
                                return ListTile(
                                  title: GestureDetector(
                                    onTap: () {
                                      controller.searchController.text = item;
                                      controller.isSearch = false;
                                      Get.toNamed(AppRoute.productList,
                                          parameters: {
                                            "account": "shopping",
                                            "keyword": item
                                          });
                                    },
                                    child: CustomText(
                                      text: item,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                );
                              } else if (item.toLowerCase().contains(controller
                                  .searchController.text
                                  .toLowerCase())) {
                                return ListTile(
                                  title: GestureDetector(
                                    onTap: () {
                                      controller.searchController.text = item;
                                      controller.isSearch = false;
                                      Get.toNamed(AppRoute.productList,
                                          parameters: {
                                            "account": "shopping",
                                            "keyword": item
                                          });
                                    },
                                    child: CustomText(
                                      text: item,
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                      )
                    : Column(
                        children: [
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
                              const CustomLoader(),
                            Status.error => ErrorScreen(
                                onTap: () => controller.keywordRepo(),
                              ),
                            Status.completed => controller.keywords.isEmpty
                                ? const SizedBox()
                                : GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                                          Get.toNamed(AppRoute.productList,
                                              parameters: {
                                                "account": "shopping",
                                                "keyword": item.keyword
                                              });
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: 8.w, bottom: 8.sp),
                                          decoration: BoxDecoration(
                                            color: AppColors.secondary,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                Status.loading => const CustomLoader(),
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
                                        controller:
                                            controller.bookScrollController,
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
                                                parameters: {
                                                  "productId": item.sId!
                                                }),
                                            child: HomeProductItem(
                                              image:
                                                  "${AppUrl.imageUrl}/${item.image?.path}",
                                              title: item.name ?? "",
                                              subTitle: item.description ?? "",
                                              isFavorite:
                                                  item.isFavorite ?? false,
                                              onTap: () => controller
                                                  .bookIsFavoriteRepo(index),
                                            ),
                                          );
                                        },
                                      ),
                              }),
                          SizedBox(
                            height: 17.h,
                          ),

                          ///================event section==============================

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: AppString.event,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                                color: AppColors.white50,
                              ),
                              InkWell(
                                onTap: () => Get.toNamed(AppRoute.eventList),
                                // parameters: {
                                //   "account": "shopping",
                                //   "keyword": "Book"
                                // }),
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
                              child: switch (controller.eventStatus) {
                                Status.loading => const CustomLoader(),
                                Status.error => ErrorScreen(
                                    onTap: () {
                                      controller.eventPage = 1;
                                      controller.eventRepo();
                                    },
                                  ),
                                Status.completed => controller.events.isEmpty
                                    ? const NoData()
                                    : GridView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        controller:
                                            controller.eventScrollController,
                                        scrollDirection: Axis.horizontal,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                                mainAxisExtent: 160.sp,
                                                crossAxisSpacing: 20.w),
                                        itemCount: controller.events.length,
                                        itemBuilder: (context, index) {
                                          var item = controller.events[index];
                                          return InkWell(
                                            onTap: () => Get.toNamed(
                                                AppRoute.eventDetails,
                                                parameters: {
                                                  "eventId": item.sId!
                                                }),
                                            child: HomeProductItem(
                                              image:
                                                  "${AppUrl.imageUrl}/${item.image?.path}",
                                              title: item.name ?? "",
                                              subTitle: item.description ?? "",
                                              isFavorite: false,
                                              showFavorite: false,
                                            ),
                                          );
                                        },
                                      ),
                              }),
                          SizedBox(
                            height: 17.h,
                          ),

                          ///================event section ==============================

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
                              Status.loading => const CustomLoader(),
                              Status.error => ErrorScreen(onTap: () {
                                  controller.burgerPage = 1;
                                  controller.burgerRepo();
                                }),
                              Status.completed => controller.burgers.isEmpty
                                  ? const NoData()
                                  : GridView.builder(
                                      controller:
                                          controller.burgerScrollController,
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
                                              parameters: {
                                                "productId": item.sId!
                                              }),
                                          child: HomeProductItem(
                                            image:
                                                "${AppUrl.imageUrl}/${item.image?.path}",
                                            title: item.name ?? "",
                                            subTitle: item.description ?? "",
                                            isFavorite:
                                                item.isFavorite ?? false,
                                            onTap: () => controller
                                                .burgerIsFavoriteRepo(index),
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
                      )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
