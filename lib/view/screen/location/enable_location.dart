import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/services/location_service.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/screen/location/inner_widget/location_request_popup.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class EnableLocationScreen extends StatefulWidget {
  const EnableLocationScreen({super.key});

  @override
  State<EnableLocationScreen> createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {
  @override
  void initState() {
    checkLocation();
    super.initState();
  }

  checkLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    print(permission);
    if (permission == LocationPermission.denied) {
      await RequestLocation.getLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 28.w),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: () => Get.toNamed(AppRoute.onboarding),
                    child: CustomText(
                      text: AppString.skip,
                      fontSize: 18,
                      top: 30.h,
                      bottom: 10.h,
                    ))),
            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: AppString.enableLocation,
                fontSize: 24.sp,
                color: AppColors.white50,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
              ),
            ),
            CustomText(
              text: AppString.enableLocationDetails,
              color: AppColors.grey200,
              bottom: 47.h,
              textAlign: TextAlign.start,
            ),
            Center(
                child: CustomImage(
              imageSrc: AppImages.enableLocation,
              imageType: ImageType.png,
              width: 295.sp,
              height: 295.sp,
            )),
            const Spacer(),
            CustomButton(
              titleText: AppString.turnOn,
              buttonWidth: double.infinity,
              onPressed: () async {
                bool isEnabled = await LocationService.checkLocationEnabled();
                if (isEnabled) {
                  Get.toNamed(AppRoute.onboarding);
                } else {
                  await Geolocator.openLocationSettings();
                }
              },
            ),
            CustomText(
              text: AppString.youCanAdjustYourLocation,
              color: AppColors.grey200,
              textAlign: TextAlign.start,
              top: 29.h,
            )
          ],
        ),
      ),
    );
  }
}
