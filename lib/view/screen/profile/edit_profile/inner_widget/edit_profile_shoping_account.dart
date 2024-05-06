import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_string.dart';
import '../../../../widget/custom_loader.dart';
import '../../../../widget/image/custom_image.dart';
import '../../../../widget/text/custom_text.dart';
import '../../../../widget/text_field/custom_text_field.dart';

class EditProfileShopingAccount extends StatefulWidget {
  EditProfileShopingAccount({super.key});

  @override
  State<EditProfileShopingAccount> createState() =>
      _EditProfileShopingAccountState();
}

class _EditProfileShopingAccountState extends State<EditProfileShopingAccount> {
  ProfileController controller = Get.put((ProfileController()));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.userName,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              hintText: AppString.userName,
              controller: controller.nameController,
              keyboardType: TextInputType.name,
              fillColor: AppColors.transparent,
              borderColor: AppColors.white50,
              paddingVertical: 10.sp,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppString.thisFieldIsRequired;
                } else {
                  return null;
                }
              },
            ),
            CustomText(
              text: AppString.phoneNumber,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              hintText: AppString.phoneNumber,
              controller: controller.numberController,
              keyboardType: TextInputType.number,
              fillColor: AppColors.transparent,
              borderColor: AppColors.white50,
              paddingVertical: 10.sp,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppString.thisFieldIsRequired;
                } else {
                  return null;
                }
              },
            ),
            CustomText(
              text: AppString.location,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              hintText: AppString.location,
              keyboardType: TextInputType.text,
              controller: controller.stateController,
              fillColor: AppColors.transparent,
              borderColor: AppColors.white50,
              paddingVertical: 10.sp,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppString.thisFieldIsRequired;
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 12.h,
            ),
            controller.isLoadingLocation
                ? CustomLoader(
                    size: 30.sp,
                  )
                : GestureDetector(
                    onTap: () => controller.currentLocation(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                  ),
            SizedBox(
              height: 80.h,
            )
          ],
        );
      },
    );
  }
}
