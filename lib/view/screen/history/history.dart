import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/history_controller.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/product_history_model.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/screen/product/product_list/inner_widget/product_item.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/custom_loader.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';
import 'package:pull_up/view/widget/no_data.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../widget/text/custom_text.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  HistoryController controller = Get.put(HistoryController());

  @override
  void initState() {
    controller.tabController = TabController(length: 2, vsync: this);
    Future.delayed(
      Duration.zero,
      () {
        controller.productHistoryRepo();
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
          text: AppString.history,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<HistoryController>(
        builder: (controller) {
          return Column(
            children: [
              TabBar(
                controller: controller.tabController,
                unselectedLabelColor: AppColors.grey200,
                labelStyle: const TextStyle(color: AppColors.primaryColor),
                onTap: (int) {
                  if (int == 0) {
                    controller.productHistoryRepo();
                  } else {
                    controller.eventHistoryRepo();
                  }
                },
                indicator: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(8.0), // Change this color as needed
                ),
                tabs: const [
                  Tab(
                    text: AppString.products,
                  ),
                  Tab(text: AppString.events),
                ],
              ),
              Expanded(
                child: controller.tabController.index == 0
                    ? switch (controller.status) {
                        Status.loading => const CustomLoader(),
                        Status.error => ErrorScreen(
                            onTap: () {
                              controller.productHistoryRepo();
                            },
                          ),
                        Status.completed => controller.productHistory.isEmpty
                            ? const NoData()
                            : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 10.h),
                              child: ListView.builder(
                                itemCount: controller.productHistory.length,
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  Data item =
                                      controller.productHistory[index];

                                  return ProductItem(
                                    title: item.productId?.name ?? "",
                                    subTitle:
                                        item.productId?.description ?? "",
                                    image:
                                        "${AppUrl.imageUrl}/${item.productId?.image?.path}",
                                    price: item.productId?.price ?? " ",
                                  );
                                },
                              ),
                            ),
                      }
                    : switch (controller.status) {
                        Status.loading => const CustomLoader(),
                        Status.error => ErrorScreen(
                            onTap: () {
                              controller.eventHistoryRepo();
                            },
                          ),
                        Status.completed => controller.eventHistory.isEmpty
                            ? const NoData()
                            : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 10.h),
                              child: ListView.builder(
                                itemCount: controller.eventHistory.length,
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var item = controller.eventHistory[index];

                                  return ProductItem(
                                    title: item.eventId?.name ?? "",
                                    subTitle:
                                        item.eventId?.description ?? "",
                                    image:
                                        "${AppUrl.imageUrl}/${item.eventId?.image?.path}",
                                    price: item.eventId?.price ?? " ",
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
