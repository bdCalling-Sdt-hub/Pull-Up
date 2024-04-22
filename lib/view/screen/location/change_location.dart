import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';
import 'package:pull_up/view/widget/text_field/custom_text_field.dart';

import '../../widget/navBar/navbar.dart';

class ChangeLocationScreen extends StatelessWidget {
  const ChangeLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.changeLocation,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white50,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 24.h),
        child: Column(
          children: [
            SizedBox(
              height: 430.sp,
              child: const Center(
                  child: CustomText(
                text: "Show Google map ",
                color: AppColors.white50,
                fontSize: 24,
              )),
            ),
            TextFormField(
              cursorColor: AppColors.white50,
              decoration: InputDecoration(
                hintText: AppString.searchCity,
                hintStyle: const TextStyle(color: AppColors.grey200),
                filled: true,
                focusColor: AppColors.white50,
                fillColor: AppColors.white50,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                prefixIcon: const Icon(
                  Icons.search_sharp,
                  color: AppColors.grey200,
                ),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 1.w),
                    borderRadius: BorderRadius.circular(10.r)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 1.w),
                    borderRadius: BorderRadius.circular(10.r)),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImage(imageSrc: AppIcons.changeLocation),
                SizedBox(
                  width: 8.w,
                ),
                CustomText(
                  text: AppString.useMyCurrentLocation,
                  color: AppColors.primaryColor,
                  fontSize: 16.sp,
                )
              ],
            ),
            SizedBox(
              height: 12.sp,
            ),
            CustomButton(
              titleText: AppString.pingLocation,
              onPressed: () => Get.toNamed(AppRoute.locatedShop),
            )
          ],
        ),
      ),
      bottomNavigationBar:  CustomBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
