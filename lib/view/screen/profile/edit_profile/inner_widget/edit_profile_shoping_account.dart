import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';
import 'package:pull_up/helper/prefs_helper.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_string.dart';
import '../../../../widget/text/custom_text.dart';
import '../../../../widget/text_field/custom_text_field.dart';

class EditProfileShopingAccount extends StatefulWidget {
  EditProfileShopingAccount({super.key});

  @override
  State<EditProfileShopingAccount> createState() =>
      _EditProfileShopingAccountState();
}

class _EditProfileShopingAccountState extends State<EditProfileShopingAccount> {
  final nameController = ValueNotifier<bool>(false);

  final numberController = ValueNotifier<bool>(false);

  final emailController = ValueNotifier<bool>(false);

  final desController = ValueNotifier<bool>(false);

  final websiteController = ValueNotifier<bool>(false);

  final hoursController = ValueNotifier<bool>(false);

  final locatorController = ValueNotifier<bool>(false);

  ProfileController controller = Get.put((ProfileController()));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Column(
          children: [
            Row(
              children: [
                CustomText(
                  text: AppString.userName,
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp,
                  textAlign: TextAlign.start,
                  color: AppColors.white50,
                ),
                const Spacer(),
                CustomText(
                  text: AppString.showProfile,
                  fontWeight: FontWeight.w300,
                  fontSize: 10.sp,
                  right: 8.w,
                  textAlign: TextAlign.start,
                  color: AppColors.white50,
                ),
                AdvancedSwitch(
                  height: 18.sp,
                  width: 36.w,
                  activeColor: AppColors.deepOrange,
                  controller: nameController,
                  initialValue: true,
                )
              ],
            ),
            SizedBox(
              height: 6.h,
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
                }
              },
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                CustomText(
                  text: AppString.phoneNumber,
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp,
                  textAlign: TextAlign.start,
                  color: AppColors.white50,
                ),
                const Spacer(),
                CustomText(
                  text: AppString.showProfile,
                  fontWeight: FontWeight.w300,
                  fontSize: 10.sp,
                  right: 8.w,
                  textAlign: TextAlign.start,
                  color: AppColors.white50,
                ),
                AdvancedSwitch(
                  height: 18.sp,
                  width: 36.w,
                  activeColor: AppColors.deepOrange,
                  controller: numberController,
                  initialValue: true,
                )
              ],
            ),
            SizedBox(
              height: 6.h,
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
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                CustomText(
                  text: AppString.emailAddress,
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp,
                  textAlign: TextAlign.start,
                  color: AppColors.white50,
                ),
                const Spacer(),
                CustomText(
                  text: AppString.showProfile,
                  fontWeight: FontWeight.w300,
                  fontSize: 10.sp,
                  right: 8.w,
                  textAlign: TextAlign.start,
                  color: AppColors.white50,
                ),
                AdvancedSwitch(
                  height: 18.sp,
                  width: 36.w,
                  activeColor: AppColors.deepOrange,
                  controller: emailController,
                  initialValue: true,
                )
              ],
            ),
            SizedBox(
              height: 6.h,
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
            SizedBox(
              height: 80.h,
            )
          ],
        );
      },
    );
  }
}
