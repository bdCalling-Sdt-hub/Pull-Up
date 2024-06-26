import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_up/controller/event/new_event_controller.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/custom_loading.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';
import 'package:pull_up/view/widget/text_field/custom_text_field.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../../utils/app_utils.dart';
import '../../../widget/custom_loader.dart';
import '../../../widget/text/custom_text.dart';

class NewEvent extends StatefulWidget {
  NewEvent({super.key});

  @override
  State<NewEvent> createState() => _NewEventState();
}

class _NewEventState extends State<NewEvent> {
  final formKey = GlobalKey<FormState>();

  NewEventController controller = Get.put(NewEventController());

  @override
  void initState() {
    controller.profileRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.newEvent,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<NewEventController>(
        builder: (controller) {
          return switch (controller.status) {
            Status.loading => const CustomLoader(),
            Status.error => ErrorScreen(
                onTap: () => controller.profileRepo(),
              ),
            Status.completed => controller.profileModel?.data?.isExpiration !=
                        null &&
                    controller.profileModel!.data!.isExpiration!
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: AppString
                            .yourSubscriptionIsExpiredPayAgainToGetService,
                        fontSize: 18.sp,
                        left: 30.w,
                        right: 30.w,
                        bottom: 20.h,
                      ),
                      CustomButton(
                        titleText: "Pay Now",
                        buttonWidth: 200.w,
                        buttonHeight: 40.h,
                        onPressed: () => Get.toNamed(AppRoute.upgradeAccount),
                      )
                    ],
                  )
                : SingleChildScrollView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: AppString.addPicture,
                            color: AppColors.white50,
                            fontWeight: FontWeight.w600,
                            bottom: 12.h,
                          ),
                          DottedBorder(
                            padding: const EdgeInsets.all(0),
                            dashPattern: const [6, 6],
                            color: AppColors.primaryColor,
                            strokeWidth: 2,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(12)),
                              width: 208.w,
                              height: 130.h,
                              child: Center(
                                  child: controller.image == null
                                      ? InkWell(
                                          onTap: () =>
                                              controller.selectImageGallery(),
                                          child: CustomImage(
                                            imageSrc: AppIcons.upload,
                                            height: 50.sp,
                                            width: 50.sp,
                                          ))
                                      : Image.file(File(controller.image!))),
                            ),
                          ),
                          CustomText(
                            text: AppString.eventsName,
                            color: AppColors.white50,
                            fontWeight: FontWeight.w600,
                            top: 24.h,
                            bottom: 4.h,
                          ),
                          CustomTextField(
                            hintText: AppString.enterYourEventsName,
                            controller: controller.nameController,
                            borderColor: AppColors.white50,
                            fillColor: AppColors.background,
                            paddingVertical: 12.h,
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppString.thisFieldIsRequired;
                              } else {
                                return null;
                              }
                            },
                          ),
                          CustomText(
                            text: AppString.description,
                            color: AppColors.white50,
                            fontWeight: FontWeight.w600,
                            top: 12.h,
                            bottom: 4.h,
                          ),
                          Container(
                            height: 116.h,
                            width: Get.width,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.white50),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.white50),
                              maxLines: 10,
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return AppString.thisFieldIsRequired;
                                } else {
                                  return null;
                                }
                              },
                              controller: controller.desController,
                              decoration: InputDecoration(
                                hintText:
                                    AppString.enterYourProductDescriptionHere,
                                border: InputBorder.none,
                                hintStyle: GoogleFonts.roboto(
                                    fontSize: 14.sp, color: AppColors.white50),
                              ),
                            ),
                          ),
                          CustomText(
                            text: AppString.price,
                            color: AppColors.white50,
                            fontWeight: FontWeight.w600,
                            top: 12.h,
                            bottom: 4.h,
                          ),
                          CustomTextField(
                            hintText: AppString.enterYourProductPrice,
                            borderColor: AppColors.white50,
                            fillColor: AppColors.background,
                            paddingVertical: 12.h,
                            controller: controller.priceController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppString.thisFieldIsRequired;
                              } else {
                                return null;
                              }
                            },
                          ),
                          CustomText(
                            text: AppString.location,
                            color: AppColors.white50,
                            fontWeight: FontWeight.w600,
                            top: 12.h,
                            bottom: 4.h,
                          ),
                          CustomTextField(
                            hintText: AppString.enterYourLocation,
                            controller: controller.addressController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppString.thisFieldIsRequired;
                              } else {
                                return null;
                              }
                            },
                            borderColor: AppColors.white50,
                            fillColor: AppColors.background,
                            paddingVertical: 12.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: AppString.selectDate,
                                color: AppColors.white50,
                                fontWeight: FontWeight.w600,
                                top: 12.h,
                                bottom: 4.h,
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
                                              imageSrc:
                                                  AppIcons.changeLocation),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          CustomText(
                                            text:
                                                AppString.useMyCurrentLocation,
                                            color: AppColors.primaryColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                          )
                                        ],
                                      ),
                                    ),
                              const SizedBox()
                            ],
                          ),
                          CustomTextField(
                            hintText: AppString.selectDate,
                            controller: controller.dateController,
                            keyboardType: TextInputType.none,
                            onTap: () {
                              controller.selectDatePicker();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppString.thisFieldIsRequired;
                              } else {
                                return null;
                              }
                            },
                            borderColor: AppColors.white50,
                            fillColor: AppColors.background,
                            paddingVertical: 12.h,
                          ),
                          CustomText(
                            text: AppString.selectTime,
                            color: AppColors.white50,
                            fontWeight: FontWeight.w600,
                            top: 12.h,
                            bottom: 4.h,
                          ),
                          CustomTextField(
                            hintText: AppString.selectTime,
                            controller: controller.timeController,
                            keyboardType: TextInputType.none,
                            onTap: () {
                              controller.selectTimePicker();
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return AppString.thisFieldIsRequired;
                              } else {
                                return null;
                              }
                            },
                            borderColor: AppColors.white50,
                            fillColor: AppColors.background,
                            paddingVertical: 12.h,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          controller.isLoading
                              ? const CustomElevatedLoadingButton()
                              : CustomButton(
                                  titleText: AppString.save,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (controller.image != null) {
                                        controller.createEventRepo();
                                      } else {
                                        Utils.snackBarMessage(
                                            "500", 'please, select image');
                                      }
                                    }
                                  },
                                )
                        ],
                      ),
                    ),
                  ),
          };
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
