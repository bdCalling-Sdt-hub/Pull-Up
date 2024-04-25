import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_up/controller/product/add_product_controller.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';
import 'package:pull_up/view/widget/text_field/custom_text_field.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/text/custom_text.dart';

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.addNewProduct,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<AddProductController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
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
                                onTap: () => controller.selectImageGallery(),
                                child: CustomImage(
                                  imageSrc: AppIcons.upload,
                                  size: 50.sp,
                                ))
                            : Image.file(File(controller.image!)),
                      ),
                    ),
                  ),
                  CustomText(
                    text: AppString.productName,
                    color: AppColors.white50,
                    fontWeight: FontWeight.w600,
                    top: 24.h,
                    bottom: 4.h,
                  ),
                  CustomTextField(
                    hintText: AppString.enterYourProductName,
                    controller: controller.productNameController,
                    borderColor: AppColors.white50,
                    fillColor: AppColors.background,
                    paddingVertical: 12.h,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppString.thisFieldIsRequired;
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
                      style:
                          TextStyle(fontSize: 14.sp, color: AppColors.white50),
                      maxLines: 10,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return AppString.thisFieldIsRequired;
                        }
                      },
                      controller: controller.desController,
                      decoration: InputDecoration(
                        hintText: AppString.enterYourProductDescriptionHere,
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
                    controller: controller.priceController,
                    paddingVertical: 12.h,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppString.thisFieldIsRequired;
                      }
                    },
                  ),
                  CustomText(
                    text: AppString.keywords,
                    color: AppColors.white50,
                    fontWeight: FontWeight.w600,
                    top: 12.h,
                    bottom: 4.h,
                  ),
                  CustomTextField(
                    controller: controller.tagController,
                    hintText: AppString.keyboardsDetails,
                    borderColor: AppColors.white50,
                    fillColor: AppColors.background,
                    textInputAction: TextInputAction.send,
                    paddingVertical: 12.h,
                    validator: (value) {
                      if (controller.tagList.isEmpty) {
                        return AppString.thisFieldIsRequired;
                      }
                    },
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        controller.tagList.add(value);

                        controller.tagController.clear();
                      }
                    },
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  controller.tagList.isNotEmpty
                      ? Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 8,
                          children: controller.tagList.map((item) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: AppColors.deepOrange,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomText(
                                        fontSize: 14,
                                        maxLines: 3,
                                        color: AppColors.white50,
                                        right: 8,
                                        text: item),
                                    GestureDetector(
                                        onTap: () => controller.removeKeyword(
                                            item),
                                        child: const Icon(
                                          Icons.close,
                                          color: AppColors.white50,
                                        )),
                                  ]),
                            );

                            //========================Remove Tag====================
                          }).toList(),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    titleText: AppString.save,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.addProductRepo();
                      }
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
