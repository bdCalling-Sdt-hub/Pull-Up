import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';


class TicketPurchasePayment extends StatefulWidget {
  const TicketPurchasePayment({super.key});

  @override
  State<TicketPurchasePayment> createState() => _TicketPurchasePaymentState();
}

class _TicketPurchasePaymentState extends State<TicketPurchasePayment> {
  RxBool isCheck = false.obs;
  bool visaCardChecked = false;
  bool masterCardChecked = false;
  bool paypalCardChecked = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.packagePurchase,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        physics: const BouncingScrollPhysics(),
        child: Container(),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisSize: MainAxisSize.max,
        //   children: [
        //     CustomText(
        //       text: AppString.choosePaymentMethod,
        //       color: AppColors.white50,
        //       fontSize: 18.sp,
        //       fontWeight: FontWeight.w600,
        //     ),
        //     CustomText(
        //       text: AppString
        //           .youWillNotBeChargedUntilYouReviewThisOrderOnTheNextPage,
        //       fontWeight: FontWeight.w300,
        //       bottom: 24.h,
        //       fontSize: 12.sp,
        //       textAlign: TextAlign.start,
        //       color: AppColors.white50,
        //     ),
        //     // Row(
        //     //   mainAxisAlignment: MainAxisAlignment.center,
        //     //   children: [
        //     //     CustomImage(
        //     //       imageSrc: AppImages.visa,
        //     //       imageType: ImageType.png,
        //     //       size: 64.sp,
        //     //     ),
        //     //     SizedBox(
        //     //       width: 14.w,
        //     //     ),
        //     //     CustomImage(
        //     //       imageSrc: AppImages.masterCard,
        //     //       imageType: ImageType.png,
        //     //       size: 64.sp,
        //     //     ),
        //     //     SizedBox(
        //     //       width: 14.w,
        //     //     ),
        //     //     CustomImage(
        //     //       imageSrc: AppImages.paypal,
        //     //       imageType: ImageType.png,
        //     //       size: 64.sp,
        //     //     )
        //     //   ],
        //     // ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         GestureDetector(
        //           onTap: () {
        //             setState(() {
        //               visaCardChecked = true;
        //               masterCardChecked = false;
        //               paypalCardChecked = false;
        //             });
        //           },
        //           child: Container(
        //             margin: EdgeInsets.only(right: 10.w),
        //             decoration: visaCardChecked
        //                 ? const BoxDecoration(boxShadow: [
        //                     BoxShadow(
        //                         blurRadius: 10,
        //                         color: AppColors.white50,
        //                         offset: Offset(0, 0))
        //                   ])
        //                 : null,
        //             child: CustomImage(
        //               imageSrc: AppImages.visa,
        //               imageType: ImageType.png,
        //               width: 64.sp,
        //               height: 64.sp,
        //             ),
        //           ),
        //         ),
        //
        //         GestureDetector(
        //           onTap: () {
        //             setState(() {
        //               visaCardChecked = false;
        //               masterCardChecked = true;
        //               paypalCardChecked = false;
        //             });
        //           },
        //           child: Container(
        //             margin: EdgeInsets.only(right: 10.w),
        //             decoration: masterCardChecked
        //                 ? const BoxDecoration(boxShadow: [
        //                     BoxShadow(
        //                         blurRadius: 10,
        //                         color: AppColors.white50,
        //                         offset: Offset(0, 0))
        //                   ])
        //                 : null,
        //             child: CustomImage(
        //               imageSrc: AppImages.masterCard,
        //               imageType: ImageType.png,
        //               height: 64.sp,
        //               width: 64.sp,
        //             ),
        //           ),
        //         ),
        //
        //         GestureDetector(
        //           onTap: () {
        //             setState(() {
        //               visaCardChecked = false;
        //               masterCardChecked = false;
        //               paypalCardChecked = true;
        //             });
        //           },
        //           child: Container(
        //             decoration: paypalCardChecked
        //                 ? const BoxDecoration(boxShadow: [
        //                     BoxShadow(
        //                         blurRadius: 10,
        //                         color: AppColors.white50,
        //                         offset: Offset(0, 0))
        //                   ])
        //                 : null,
        //             child: CustomImage(
        //               imageSrc: AppImages.paypal,
        //               imageType: ImageType.png,
        //               width: 64.sp,
        //               height: 64.sp,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(
        //       height: 30.h,
        //     ),
        //     CustomText(
        //       text: AppString.nameOnCard,
        //       fontWeight: FontWeight.w300,
        //       bottom: 6.h,
        //       fontSize: 14.sp,
        //       textAlign: TextAlign.start,
        //       color: AppColors.white50,
        //     ),
        //     CustomTextField(
        //       hintText: AppString.enterCardHolderName,
        //       fillColor: AppColors.white50,
        //       hintTextColor: AppColors.grey200,
        //       paddingVertical: 14.h,
        //       textColor: AppColors.grey900,
        //       prefixSvgIcon: Padding(
        //         padding: EdgeInsets.all(12.sp),
        //         child: CustomImage(imageSrc: AppIcons.profile),
        //       ),
        //     ),
        //     CustomText(
        //       text: AppString.cardNumber,
        //       fontWeight: FontWeight.w300,
        //       bottom: 6.h,
        //       top: 10.h,
        //       fontSize: 14.sp,
        //       textAlign: TextAlign.start,
        //       color: AppColors.white50,
        //     ),
        //     CustomTextField(
        //       hintText: AppString.enterCardHolderNumber,
        //       fillColor: AppColors.white50,
        //       hintTextColor: AppColors.grey200,
        //       textColor: AppColors.grey900,
        //       keyboardType: TextInputType.number,
        //       paddingVertical: 14.h,
        //       prefixSvgIcon: Padding(
        //         padding: EdgeInsets.all(12.sp),
        //         child: CustomImage(imageSrc: AppIcons.card),
        //       ),
        //     ),
        //     SizedBox(
        //       height: 10.h,
        //     ),
        //     Row(
        //       children: [
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               CustomText(
        //                 text: AppString.expirationDate,
        //                 fontWeight: FontWeight.w300,
        //                 bottom: 6.h,
        //                 fontSize: 14.sp,
        //                 textAlign: TextAlign.start,
        //                 color: AppColors.white50,
        //               ),
        //               CustomTextField(
        //                 hintText: AppString.mm,
        //                 fillColor: AppColors.white50,
        //                 hintTextColor: AppColors.grey200,
        //                 keyboardType: TextInputType.number,
        //                 textColor: AppColors.grey900,
        //                 paddingVertical: 14.h,
        //                 prefixSvgIcon: Padding(
        //                   padding: EdgeInsets.all(12.sp),
        //                   child: CustomImage(imageSrc: AppIcons.date),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           width: 12.w,
        //         ),
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               CustomText(
        //                 text: AppString.cvv,
        //                 fontWeight: FontWeight.w300,
        //                 bottom: 6.h,
        //                 fontSize: 14.sp,
        //                 textAlign: TextAlign.start,
        //                 color: AppColors.white50,
        //               ),
        //               CustomTextField(
        //                 hintText: AppString.cvv,
        //                 fillColor: AppColors.white50,
        //                 textColor: AppColors.grey900,
        //                 hintTextColor: AppColors.grey200,
        //                 keyboardType: TextInputType.number,
        //                 paddingVertical: 14.h,
        //                 isPassword: true,
        //                 prefixSvgIcon: Padding(
        //                   padding: EdgeInsets.all(12.sp),
        //                   child: CustomImage(imageSrc: AppIcons.lock, ),
        //                 ),
        //                 paddingHorizontal: 0.sp,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(
        //       height: 22.h,
        //     ),
        //     Row(
        //       children: [
        //         Obx(
        //           () => Checkbox(
        //             value: isCheck.value,
        //             activeColor: AppColors.deepOrange,
        //             onChanged: (value) {
        //               isCheck.value = value!;
        //             },
        //           ),
        //         ),
        //         Expanded(
        //             child: CustomText(
        //           text: AppString.myBillingAddressIsTheSameAsMyShippingAddress,
        //           color: AppColors.white50,
        //           textAlign: TextAlign.start,
        //           fontSize: 12.sp,
        //         ))
        //       ],
        //     ),
        //     SizedBox(
        //       height: 40.h,
        //     ),
        //     CustomButton(
        //       titleText: AppString.confirmAndContinue,
        //       onPressed: () => PaymentPopUp.paymentSuccessfulPopUp(),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
