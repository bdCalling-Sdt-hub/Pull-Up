import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_up/controller/add_deal_controller.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';
import 'package:pull_up/view/widget/text_field/custom_text_field.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/text/custom_text.dart';

class AddDeal extends StatelessWidget {
  AddDeal({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.deal,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<AddDealController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
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
                    width: Get.width,
                    height: 200,
                    child: Center(
                        child: controller.image == null
                            ? InkWell(
                          onTap: () => controller.selectImageGallery(),
                            child: CustomImage(imageSrc: AppIcons.upload, size: 50.sp,))
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
                  borderColor: AppColors.white50,
                  fillColor: AppColors.background,
                  paddingVertical: 12.h,
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
                    style: TextStyle(fontSize: 14.sp, color: AppColors.white50),
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: AppString.enterYourProductDescriptionHere,
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.roboto(
                          fontSize: 14.sp, color: AppColors.white50),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                  titleText: AppString.save,
                  onPressed: () => Get.toNamed(AppRoute.productList),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar:  CustomBottomNavBar(currentIndex: 2),
    );
  }
}
