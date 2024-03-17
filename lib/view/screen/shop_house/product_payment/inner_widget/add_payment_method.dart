import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/view/screen/shop_house/product_payment/inner_widget/successful_popup.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/text_field/custom_text_field.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_string.dart';
import '../../../../widget/custom_image.dart';
import '../../../../widget/text/custom_text.dart';

class AddPaymentMethod extends StatelessWidget {
  const AddPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.height,
      height: Get.height,
      margin: EdgeInsets.only(top: 200.h),
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
      decoration: BoxDecoration(
          color: AppColors.yellow50,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.r), topRight: Radius.circular(50.r))),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomText(
              text: AppString.addPaymentMethod,
              color: AppColors.primaryColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: AppString.addPaymentMethodForUpgradeSubscription,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              bottom: 18.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomImage(
                  imageSrc: AppImages.visa,
                  imageType: ImageType.png,
                  size: 64.sp,
                ),
                SizedBox(
                  width: 14.w,
                ),
                CustomImage(
                  imageSrc: AppImages.masterCard,
                  imageType: ImageType.png,
                  size: 64.sp,
                ),
                SizedBox(
                  width: 14.w,
                ),
                CustomImage(
                  imageSrc: AppImages.paypal,
                  imageType: ImageType.png,
                  size: 64.sp,
                )
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            CustomTextField(
              labelText: AppString.enterCardHolderName,
              fillColor: AppColors.white50,
              labelTextColor: AppColors.grey200,
              paddingVertical: 14.h,
              prefixSvgIcon: Padding(
                padding: EdgeInsets.all(12.sp),
                child: CustomImage(imageSrc: AppIcons.profile),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            CustomTextField(
              labelText: AppString.enterCardHolderNumber,
              fillColor: AppColors.white50,
              labelTextColor: AppColors.grey200,
              paddingVertical: 14.h,
              prefixSvgIcon: Padding(
                padding: EdgeInsets.all(12.sp),
                child: CustomImage(imageSrc: AppIcons.card),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            CustomTextField(
              labelText: AppString.cvv,
              fillColor: AppColors.white50,
              labelTextColor: AppColors.grey200,
              paddingVertical: 14.h,
              prefixSvgIcon: Padding(
                padding: EdgeInsets.all(12.sp),
                child: CustomImage(imageSrc: AppIcons.lock),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            CustomTextField(
              labelText: AppString.mm,
              fillColor: AppColors.white50,
              labelTextColor: AppColors.grey200,
              paddingVertical: 14.h,
              prefixSvgIcon: Padding(
                padding: EdgeInsets.all(12.sp),
                child: CustomImage(imageSrc: AppIcons.date),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            CustomButton(
              titleText: AppString.proceedToPayment,
              onPressed: () => PopUp.successfulPopUp(),
            )
          ],
        ),
      ),
    );
  }
}
