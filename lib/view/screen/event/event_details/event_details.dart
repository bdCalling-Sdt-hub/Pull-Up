import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/event/event_details_controller.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../widget/navBar/navbar.dart';
import 'inner_widget/event_info.dart';

class EventDetailsScreen extends StatefulWidget {
  EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  String eventId = Get.parameters["eventId"] ?? "";

  EventDetailsController controller = Get.put(EventDetailsController());

  @override
  void initState() {
    controller.eventDetailsRepo(eventId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      extendBody: true,
      body: GetBuilder<EventDetailsController>(builder: (controller) {
        return switch (controller.status) {
          Status.loading => const Center(child: CircularProgressIndicator()),
          Status.error => ErrorScreen(
              onTap: () => controller.eventDetailsRepo(eventId),
            ),
          Status.completed => SingleChildScrollView(
              child: Column(
                children: [
                  CustomImage(
                    imageSrc:
                        "${AppUrl.imageUrl}/${controller.eventDetailsModel?.data?.image?.path ?? ""}",
                    imageType: ImageType.decorationImage,
                    height: 200.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          text: controller.eventDetailsModel?.data?.name ?? "",
                          color: AppColors.white50,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                          fontSize: 24.sp,
                          top: 8.h,
                          bottom: 18.h,
                        ),
                        const EventInfo(),
                        Align(
                            alignment: FractionalOffset.centerLeft,
                            child: CustomText(
                              text: AppString.aboutEvent,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white50,
                              fontSize: 18.sp,
                              top: 18.h,
                            )),
                        CustomText(
                          text:
                              controller.eventDetailsModel?.data?.description ??
                                  "",
                          color: AppColors.yellow50,
                          textAlign: TextAlign.start,
                          top: 10.h,
                          bottom: 30.h,
                        ),
                        CustomButton(
                            titleText:
                                "${AppString.buyTicket} \$${controller.eventDetailsModel?.data?.price ?? ""}",
                            buttonHeight: 50.h,
                            buttonRadius: 6.r,
                            onPressed: () async {
                              var data = await Get.toNamed(AppRoute.payment,
                                  parameters: {
                                    "amount": controller
                                            .eventDetailsModel?.data?.price ??
                                        "0"
                                  });

                              if (data != null) {
                                print("data Not null: $data");
                                controller.paymentRepo(data);
                              } else {
                                print("data null: $data");
                              }
                            })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  )
                ],
              ),
            ),
        };
      }),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}
