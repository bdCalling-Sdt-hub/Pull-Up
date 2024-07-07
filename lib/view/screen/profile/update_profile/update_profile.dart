import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/custom_loading.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/custom_loader.dart';
import '../../../widget/image/custom_image.dart';
import '../../../widget/profile/profile_image.dart';
import '../../../widget/text/custom_text.dart';
import '../../../widget/text_field/custom_text_field.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({super.key});

  final formKey = GlobalKey<FormState>();

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
        appBar: AppBar(
          leading: const AppbarIcon(),
          title: CustomText(
            text: AppString.profile,
            color: AppColors.white50,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        body: GetBuilder<ProfileController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    const ProfileImage(),
                    CustomText(
                      text: controller.nameController.text,
                      color: AppColors.white50,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      top: 8.h,
                    ),
                    Column(
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
                        // CustomText(
                        //   text: AppString.email,
                        //   fontWeight: FontWeight.w300,
                        //   fontSize: 14.sp,
                        //   top: 12.h,
                        //   bottom: 6.h,
                        //   textAlign: TextAlign.start,
                        //   color: AppColors.white50,
                        // ),
                        // CustomTextField(
                        //   hintText: AppString.email,
                        //   keyboardType: TextInputType.emailAddress,
                        //   controller: controller.emailController,
                        //   fillColor: AppColors.transparent,
                        //   borderColor: AppColors.white50,
                        //   paddingVertical: 10.sp,
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return AppString.thisFieldIsRequired;
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
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
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    controller.isLoading
                        ? const CustomElevatedLoadingButton()
                        : CustomButton(
                            titleText: AppString.save,
                            onPressed: () {
                              print(controller.image);
                              if (formKey.currentState!.validate()) {
                                controller.updateProfile();
                              }
                            })
                  ],
                ),
              ),
            );
          },
        ));
  }
}
