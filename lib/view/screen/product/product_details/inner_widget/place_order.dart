import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/product/product_details_controller.dart';
import 'package:pull_up/core/app_route.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_string.dart';
import '../../../../widget/image/custom_image.dart';
import '../../../../widget/text/custom_text.dart';
import 'another_shoppings.dart';

class PlaceOrder extends StatelessWidget {
  PlaceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      builder: (controller) {
        return Container(
          width: Get.height,
          height: Get.height,
          margin: EdgeInsets.only(top: 250.h),
          padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.h),
          decoration: BoxDecoration(
              color: AppColors.yellow50,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  topRight: Radius.circular(50.r))),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: CustomText(
                        text: controller.productDetailsModel?.data?.name ?? "",
                        color: AppColors.primaryColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        controller.productDetailsModel?.data?.averageRating !=
                                null
                            ? Icon(
                                Icons.star,
                                color: AppColors.primaryColor,
                                size: 14.sp,
                              )
                            : const SizedBox(),
                        SizedBox(width: 4.w),
                        CustomText(
                          text: controller.productDetailsModel?.data
                                      ?.averageRating !=
                                  null
                              ? controller
                                      .productDetailsModel?.data?.averageRating
                                      .toString() ??
                                  ""
                              : "",
                          color: AppColors.grey300,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.close,
                      color: AppColors.grey900,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: controller
                                    .productDetailsModel?.data?.description ??
                                "",
                            fontSize: 18.sp,
                            maxLines: 1,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    CustomText(
                      text:
                          "\$${controller.productDetailsModel?.data?.price ?? ""}",
                      fontSize: 20.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    CustomImage(imageSrc: AppIcons.timer),
                    CustomText(
                      text: "10 min",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      left: 8.w,
                      right: 12.w,
                    ),
                    CustomImage(imageSrc: AppIcons.car),
                    CustomText(
                      text: "Free Delivery",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      left: 8.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppString.quick,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      left: 8.w,
                      right: 12.w,
                    ),
                    Row(
                      children: [
                        Container(
                            height: 40.sp,
                            width: 45.sp,
                            decoration: BoxDecoration(
                                color: AppColors.deepOrange,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    bottomLeft: Radius.circular(10.r))),
                            child: IconButton(
                                onPressed: () => controller.decrement(),
                                icon: const Icon(Icons.remove))),
                        Container(
                            height: 40.sp,
                            width: 85.sp,
                            color: AppColors.yellow50,
                            child: Center(
                                child: Text(controller.item.toString()))),
                        Container(
                            height: 40.sp,
                            width: 45.sp,
                            decoration: BoxDecoration(
                                color: AppColors.deepOrange,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.r),
                                    bottomRight: Radius.circular(10.r))),
                            child: IconButton(
                                onPressed: () => controller.increment(),
                                icon: const Icon(Icons.add))),
                      ],
                    ),
                  ],
                ),
                controller.productDetailsModel?.data?.address != null
                    ? Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            color: AppColors.yellow100,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: AppString.address,
                                  color: AppColors.background,
                                ),
                                CustomText(
                                  text: controller
                                          .productDetailsModel?.data?.address ??
                                      "",
                                  color: AppColors.background,
                                  fontSize: 16.h,
                                  fontWeight: FontWeight.w700,
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                Align(
                    alignment: FractionalOffset.centerLeft,
                    child: CustomText(
                      text: AppString.anotherShopping,
                      color: AppColors.grey300,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      top: 10.h,
                      bottom: 10.h,
                    )),
                const SizedBox(
                  height: 110,
                  child: AnotherShopping(),
                ),
                InkWell(
                  onTap: () async {
                    var data = await Get.toNamed(AppRoute.payment,
                        parameters: {"amount": "${controller.price}"});

                    if (data != null) {
                      print("data Not null: $data");
                      controller.paymentRepo(data);
                    } else {
                      print("data null: $data");
                    }
                  },
                  child: Container(
                    height: 60.sp,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.primaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: AppString.order,
                              fontSize: 18.sp,
                              color: AppColors.white50,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomText(
                              text: "(${controller.item} item)",
                              color: AppColors.white50,
                              fontWeight: FontWeight.w300,
                              left: 6.w,
                            ),
                          ],
                        ),
                        CustomText(
                          text: "\$${controller.price}",
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: AppColors.white50,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
