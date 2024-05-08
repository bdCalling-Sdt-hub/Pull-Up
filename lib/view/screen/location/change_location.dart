import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pull_up/controller/location/change_location.dart';

import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/custom_loader.dart';
import 'package:pull_up/view/widget/custom_loading.dart';
import 'package:pull_up/view/widget/google_map/google_map.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../widget/navBar/navbar.dart';

class ChangeLocationScreen extends StatefulWidget {
  const ChangeLocationScreen({super.key});

  @override
  State<ChangeLocationScreen> createState() => _ChangeLocationScreenState();
}

class _ChangeLocationScreenState extends State<ChangeLocationScreen> {
  final formKey = GlobalKey<FormState>();

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
      body: GetBuilder<ChangeLocationController>(
        builder: (controller) {
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ShowGoogleMap(
                    latitude: controller.latitude,
                    longitude: controller.longitude,
                    onTapLatLong: controller.latLongToAddress,
                  ),
                ),
                SizedBox(
                  height: 220.sp,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                    child: Column(
                      children: [
                        TextFormField(
                          cursorColor: AppColors.white50,
                          controller: controller.searchController,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return AppString.thisFieldIsRequired;
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: AppString.searchCity,
                            hintStyle:
                                const TextStyle(color: AppColors.grey200),
                            filled: true,
                            focusColor: AppColors.white50,
                            fillColor: AppColors.white50,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 16.w),
                            prefixIcon: const Icon(
                              Icons.search_sharp,
                              color: AppColors.grey200,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 1.w),
                                borderRadius: BorderRadius.circular(10.r)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryColor, width: 1.w),
                                borderRadius: BorderRadius.circular(10.r)),
                          ),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        controller.isLoading
                            ? CustomLoader(
                                size: 30.sp,
                              )
                            : GestureDetector(
                                onTap: () => controller.currentLocation(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomImage(
                                        imageSrc: AppIcons.changeLocation),
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
                              ),
                        const Spacer(),
                        controller.isLoadingButton
                            ? const CustomElevatedLoadingButton()
                            : CustomButton(
                                titleText: AppString.pingLocation,
                                onPressed: () {
                                  print(
                                      "longitude:${controller.longitude} latitude:${controller.latitude}");
                                  if (formKey.currentState!.validate()) {
                                    controller.pingLocation();
                                  }
                                },
                              )
                      ],
                    ),
                  ),
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
