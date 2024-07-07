import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/upgrade_account/upgrade_account.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';
import 'package:pull_up/view/widget/text_field/custom_text_field.dart';

import '../../../../../utils/app_icons.dart';
import '../../../../widget/custom_loader.dart';
import '../../../../widget/image/custom_image.dart';

class LocationPopUp {
  static UpgradeAccountController controller =
      Get.put(UpgradeAccountController());
  static final formKey = GlobalKey<FormState>();

  static getLocation() {
    showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.grey300,
            content: Form(
              key: formKey,
              child: GetBuilder<UpgradeAccountController>(
                builder: (controller) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                            onTap: () => Get.back(),
                            child: const Icon(
                              Icons.close,
                              color: AppColors.white50,
                            )),
                      ),
                      CustomText(
                        text: AppString.location,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        bottom: 28,
                      ),
                      CustomTextField(
                        controller: controller.addressController,
                        paddingVertical: 10,
                        fillColor: AppColors.transparent,
                        borderColor: AppColors.white50,
                        labelText: AppString.address,
                        labelTextColor: AppColors.white500,
                        textColor: AppColors.white500,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return AppString.thisFieldIsRequired;
                          }
                        },
                      ),
                      CustomText(
                        text: AppString.or,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white50,
                        bottom: 4.h,
                        top: 12.h,
                      ),
                      controller.isLoadingLocation
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
                      CustomText(
                        text: AppString.or,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white50,
                        bottom: 4.h,
                        top: 12.h,
                      ),
                      GestureDetector(
                        onTap: () async {
                          var data =
                              await Get.toNamed(AppRoute.selectLocationFromMap);

                          print(data.runtimeType);
                          print(data);

                          if (data != null) {
                            controller.selectLocation(data);
                          }
                        },
                        child: CustomText(
                          text: AppString.selectFromMap,
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                      CustomText(
                        text: AppString.selectFromMapNote,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white50,
                        textAlign: TextAlign.start,
                        fontSize: 10.sp,
                        bottom: 14.h,
                        top: 8.h,
                      ),
                      CustomButton(
                          titleText: AppString.confirm,
                          buttonWidth: 130.w,
                          buttonHeight: 36.h,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              if (controller.accountName == "shopping") {
                                print(controller.accountName);
                                controller.shoppingUpgradedAccountRepo();
                              } else {
                                controller.stripePayment();
                              }

                              // controller.stripePayment();
                            }
                          })
                    ],
                  );
                },
              ),
            ),
          );
        });
  }
}
