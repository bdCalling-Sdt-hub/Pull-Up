import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/event/my_event_controller.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/screen/product/product_list/inner_widget/product_item.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/custom_loader.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';
import 'package:pull_up/view/widget/no_data.dart';

import '../../../../model/my_event_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/text/custom_text.dart';

class MyEvent extends StatefulWidget {
  MyEvent({super.key});

  @override
  State<MyEvent> createState() => _MyEventState();
}

class _MyEventState extends State<MyEvent> with SingleTickerProviderStateMixin {
  MyEventController controller = Get.put(MyEventController());

  @override
  void initState() {
    controller.tabController = TabController(length: 2, vsync: this);
    Future.delayed(
      Duration.zero,
      () {
        controller.page = 1;
        controller.eventsRepo();
        controller.scrollController.addListener(() {
          controller.scrollControllerCall();
        });
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.myEvent,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(AppRoute.newEvent),
            child: CustomText(
              text: AppString.addNewEvent,
              color: AppColors.white50,
              right: 30.w,
            ),
          )
        ],
      ),
      body: GetBuilder<MyEventController>(
        builder: (controller) {
          return Column(
            children: [
              TabBar(
                controller: controller.tabController,
                unselectedLabelColor: AppColors.grey200,
                labelStyle: const TextStyle(color: AppColors.primaryColor),
                onTap: (int) {
                  if (int == 0) {
                    controller.page = 1;
                    controller.eventsRepo();
                  } else {
                    controller.myEventHistoryRepo();
                  }
                },
                indicator: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(8.0), // Change this color as needed
                ),
                tabs: const [
                  Tab(
                    text: AppString.myEvent,
                  ),
                  Tab(text: AppString.history),
                ],
              ),
              Expanded(
                child: controller.tabController.index == 0
                    ? switch (controller.status) {
                        Status.loading => const CustomLoader(),
                        Status.error => ErrorScreen(
                            onTap: () {
                              controller.page = 1;
                              controller.eventsRepo();
                            },
                          ),
                        Status.completed => controller.products.isEmpty
                            ? const NoData()
                            : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 10.h),
                              child: ListView.builder(
                                itemCount: controller.products.length,
                                controller: controller.scrollController,
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  Result item = controller.products[index];
                                  return ProductItem(
                                    title: item.name ?? "",
                                    subTitle: item.description ?? "",
                                    image:
                                        "${AppUrl.imageUrl}/${item.image?.path}",
                                    price: item.price ?? " ",
                                  );
                                },
                              ),
                            ),
                      }
                    : switch (controller.status) {
                        Status.loading => const CustomLoader(),
                        Status.error => ErrorScreen(
                            onTap: () {
                              controller.page = 1;
                              controller.eventsRepo();
                            },
                          ),
                        Status.completed => controller.eventHistory.isEmpty
                            ? const NoData()
                            : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 10.h),
                              child: ListView.builder(
                                itemCount: controller.eventHistory.length,
                                controller: controller.scrollController,
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var item = controller.eventHistory[index];
                                  return ProductItem(
                                    title: item.eventId.name ?? "",
                                    subTitle:
                                        item.eventId.description ?? "",
                                    image:
                                        "${AppUrl.imageUrl}/${item.eventId.image?.path}",
                                    price: item.eventId.price ?? " ",
                                  );
                                },
                              ),
                            ),
                      },
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
