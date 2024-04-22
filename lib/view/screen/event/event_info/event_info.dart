import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../widget/navBar/navbar.dart';
import 'inner_widget/event_info.dart';

class EventInfoScreen extends StatelessWidget {
  const EventInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomImage(
              imageSrc: AppImages.seminar,
              imageType: ImageType.png,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
              child: Column(
                children: [
                  CustomText(
                    text: AppString.innovateXTheFuture,
                    color: AppColors.white50,
                    fontWeight: FontWeight.w600,
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
                    text: AppString.aboutEventDetails,
                    color: AppColors.yellow50,
                    textAlign: TextAlign.start,
                    top: 10.h,
                    bottom: 30.h,
                  ),
                  CustomButton(
                    titleText: "${AppString.buyTicket} \$120",
                    buttonHeight: 50.h,
                    buttonRadius: 6.r,
                    onPressed: () => Get.toNamed(
                      AppRoute.ticketPayment,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            )
          ],
        ),
      ),
      bottomNavigationBar:  CustomBottomNavBar(currentIndex: 0),
    );
  }
}
