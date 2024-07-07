import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_string.dart';
import '../../../../widget/custom_loader.dart';
import '../../../../widget/image/custom_image.dart';
import '../../../../widget/text/custom_text.dart';
import '../../../../widget/text_field/custom_text_field.dart';

class EditProfileOrganisationAccount extends StatefulWidget {
  EditProfileOrganisationAccount({super.key});

  @override
  State<EditProfileOrganisationAccount> createState() =>
      _EditProfileOrganisationAccountState();
}

class _EditProfileOrganisationAccountState
    extends State<EditProfileOrganisationAccount> {
  ProfileController controller = Get.put((ProfileController()));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.organizationName,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              textAlign: TextAlign.start,
              color: AppColors.white50,
              bottom: 6.h,
            ),
            CustomTextField(
              hintText: AppString.organizationName,
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
              textAlign: TextAlign.start,
              color: AppColors.white50,
              top: 12.h,
              bottom: 6.h,
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
              text: AppString.email,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              controller: controller.emailController,
              hintText: AppString.email,
              keyboardType: TextInputType.emailAddress,
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
              text: AppString.accountHolderName,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              controller: controller.accountHolderNameController,
              hintText: AppString.accountHolderName,
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
              text: AppString.accountNumber,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              controller: controller.accountNumberController,
              hintText: AppString.accountNumber,
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
              text: AppString.routingNumber,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              controller: controller.routingNumberController,
              hintText: AppString.routingNumber,
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
              text: AppString.country,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              controller: controller.countryController,
              hintText: AppString.country,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppString.city,
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp,
                  top: 12.h,
                  bottom: 6.h,
                  textAlign: TextAlign.start,
                  color: AppColors.white50,
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

                SizedBox()
              ],
            ),
            CustomTextField(
              controller: controller.cityController,
              hintText: AppString.city,
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
              text: AppString.state,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              controller: controller.stateController,
              hintText: AppString.state,
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
              text: AppString.line,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              controller: controller.line1Controller,
              hintText: AppString.line,
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
              text: AppString.postalCode,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              top: 12.h,
              bottom: 6.h,
              textAlign: TextAlign.start,
              color: AppColors.white50,
            ),
            CustomTextField(
              controller: controller.postalCodeController,
              hintText: AppString.postalCode,
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
            SizedBox(
              height: 12.h,
            ),
          ],
        );
      },
    );
  }
}
