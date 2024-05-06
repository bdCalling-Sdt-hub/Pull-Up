import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/event/event_list_controller.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/event_model.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/custom_loader.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/text_field/custom_text_field.dart';

import '../../../../core/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/image/custom_image.dart';
import '../../../widget/navBar/navbar.dart';
import '../../../widget/text/custom_text.dart';
import 'inner_widget/recommendation_list_item.dart';
import 'inner_widget/upcomming_event_item.dart';

class EventListScreen extends StatefulWidget {
  EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  EventListController controller = Get.put(EventListController());

  @override
  void initState() {
    controller.page = 1;
    controller.eventsRepo();
    controller.scrollController.addListener(() {
      controller.scrollControllerCall();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: const AppbarIcon(),
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
      body: GetBuilder<EventListController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
            child: Column(
              children: [
                CustomTextField(
                  hintTextColor: AppColors.white50,
                  textColor: AppColors.white50,
                  hintText: AppString.searchForKeywords,
                  suffixIcon: const Icon(
                    Icons.search_sharp,
                    color: AppColors.white50,
                  ),
                  borderColor: AppColors.white50,
                  fillColor: AppColors.transparent,
                  paddingVertical: 10.h,
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
                  child: switch (controller.status) {
                    Status.loading =>
                      const CustomLoader(),
                    Status.error => ErrorScreen(
                        onTap: () {
                          controller.page = 1;
                          controller.eventsRepo();
                        },
                      ),
                    Status.completed => ListView.builder(
                        itemCount: controller.events.length,
                        controller: controller.scrollController,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Data item = controller.events[index];
                          print(
                              "==================> location ${item.eventData?.location}");
                          return GestureDetector(
                              onTap: () => Get.toNamed(AppRoute.eventDetails,
                                  parameters: {"eventId": item.sId ?? ""}),
                              child: UpcommingEventItem(
                                firstImage: item.userData != null &&
                                        item.userData!.isNotEmpty
                                    ? item.userData![0].image?.path ?? ""
                                    : "",
                                secondImage: item.userData != null &&
                                        item.userData!.length >= 2
                                    ? item.userData![1].image?.path ?? ""
                                    : "",
                                thirdImage: item.userData != null &&
                                        item.userData!.length >= 3
                                    ? item.userData![2].image?.path ?? ""
                                    : "",
                                joinNumber: item.userData != null
                                    ? item.userData!.length > 2
                                        ? (item.userData!.length - 3).toString()
                                        : "0"
                                    : "0",
                                name: item.eventData?.name ?? "",
                                des: item.eventData?.description ?? "",
                                image:
                                    "${AppUrl.imageUrl}/${item.eventData?.image?.path ?? ""}",
                                location: item.eventData?.location ?? "",
                                price: item.eventData?.price ?? "",
                              ));
                        },
                      ),
                  },
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
                    itemCount: controller.events.length,
                    controller: controller.scrollController,
                    itemBuilder: (context, index) {
                      Data item = controller.events.reversed.toList()[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed(AppRoute.eventDetails,
                            parameters: {"eventId": item.sId ?? ""}),
                        child: RecommendationsListItem(
                          image:
                              "${AppUrl.imageUrl}/${item.eventData?.image?.path}",
                          title: item.eventData?.name ?? "",
                          price: item.eventData?.price ?? "",
                        ),
                      );
                    },
                  ),
                ),
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
