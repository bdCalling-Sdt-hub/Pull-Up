import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/notification_controller.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/notification_model.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/custom_loader.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/no_data.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../widget/navBar/navbar.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationController controller = Get.put(NotificationController());

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        controller.page = 1;
        controller.notificationsRepo();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.notifications,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<NotificationController>(
        builder: (controller) {
          return switch (controller.status) {
            Status.loading => const CustomLoader(),
            Status.error => ErrorScreen(
                onTap: () {
                  controller.page = 1;
                  controller.notificationsRepo();
                },
              ),
            Status.completed => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: controller.notifications.isEmpty
                    ? const NoData()
                    : ListView.builder(
                        itemCount: controller.notifications.length,
                        itemBuilder: (context, index) {
                          Result item = controller.notifications[index];
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: item.message ?? "",
                                        color: AppColors.white50,
                                        fontSize: 16.sp,
                                        bottom: 4.h,
                                      ),
                                      CustomText(
                                        text: controller
                                            .getFormattedDate(item.createdAt!),
                                        color: AppColors.white50,
                                        fontWeight: FontWeight.w300,
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
          };
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}
