import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';
import 'package:pull_up/helper/prefs_helper.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_string.dart';
import '../../../../../utils/app_utils.dart';
import '../../../../widget/button/custom_button.dart';
import '../../../../widget/custom_loading.dart';
import '../../../../widget/text/custom_text.dart';
import '../../../../widget/text_field/custom_text_field.dart';

class EditProfileBusinessAccount extends StatefulWidget {
  EditProfileBusinessAccount({super.key});

  @override
  State<EditProfileBusinessAccount> createState() =>
      _EditProfileBusinessAccountState();
}

class _EditProfileBusinessAccountState
    extends State<EditProfileBusinessAccount> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.businessName,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              hintText: AppString.businessName,
              controller: controller.nameController,
              keyboardType: TextInputType.name,
              fillColor: AppColors.transparent,
              borderColor: AppColors.white50,
              paddingVertical: 10.sp,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppString.thisFieldIsRequired;
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
                }
              },
            ),
            CustomText(
              text: AppString.emailAddress,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              hintText: AppString.emailAddress,
              keyboardType: TextInputType.emailAddress,
              controller: controller.emailController,
              fillColor: AppColors.transparent,
              borderColor: AppColors.white50,
              paddingVertical: 10.sp,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppString.thisFieldIsRequired;
                }
              },
            ),
            CustomText(
              text: AppString.dateOfBrith,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              controller: controller.dateOfBrithController,
              hintText: AppString.dateOfBrith,
              keyboardType: TextInputType.none,
              fillColor: AppColors.transparent,
              borderColor: AppColors.white50,
              onTap: () {
                controller.dateOfBrithTimePicker();
              },
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
              text: AppString.description,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            Container(
              height: 115.sp,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white50),
                  borderRadius: BorderRadius.circular(10.r)),
              child: TextFormField(
                style: TextStyle(fontSize: 14.sp, color: AppColors.white50),
                maxLines: 10,
                controller: controller.desController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppString.thisFieldIsRequired;
                  }
                },
                decoration: InputDecoration(
                  hintText: AppString.description,
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.roboto(
                      fontSize: 14.sp, color: AppColors.white50),
                ),
              ),
            ),
            CustomText(
              text: AppString.website,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              controller: controller.websiteController,
              hintText: AppString.website,
              keyboardType: TextInputType.url,
              fillColor: AppColors.transparent,
              borderColor: AppColors.white50,
              paddingVertical: 10.sp,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppString.thisFieldIsRequired;
                }
              },
            ),
            CustomText(
              text: AppString.businessHours,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              hintText: AppString.businessHours,
              controller: controller.businessHoursController,
              keyboardType: TextInputType.none,
              fillColor: AppColors.transparent,
              borderColor: AppColors.white50,
              onTap: () {
                controller.validationTimePicker();
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return AppString.thisFieldIsRequired;
                }
              },
              paddingVertical: 10.sp,
              suffixIcon: const Icon(
                Icons.calendar_month_outlined,
                color: AppColors.white50,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
          ],
        );
      },
    );
  }
}
