import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/shop_house_controller.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/shop_product_model.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/widget/custom_loader.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/no_data.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../widget/home_product_item.dart';

class ShopHouseScreen extends StatefulWidget {
  const ShopHouseScreen({super.key});

  @override
  State<ShopHouseScreen> createState() => _ShopHouseScreenState();
}

class _ShopHouseScreenState extends State<ShopHouseScreen> {
  String userId = Get.parameters["userId"] ?? "";

  ShopHouseController controller = Get.put(ShopHouseController());

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        controller.shopHouseRepo(userId);
        controller.productsRepo(userId);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: GetBuilder<ShopHouseController>(
        builder: (controller) {
          return switch (controller.status) {
            Status.loading => const CustomLoader(),
            Status.error => ErrorScreen(
                onTap: () => controller.shopHouseRepo(userId),
              ),
            Status.completed => Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomImage(
                    imageSrc:
                        "${AppUrl.imageUrl}/${controller.singleShopModel?.data?.image?.path ?? ""}",
                    width: Get.width,
                    height: 340.h,
                    imageType: ImageType.decorationImage,
                  ),
                  Container(
                    width: Get.width,
                    height: Get.height,
                    margin: EdgeInsets.only(top: 270.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.r),
                            topRight: Radius.circular(50.r))),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: AppColors.primaryColor,
                                    size: 18.sp,
                                  ),
                                  SizedBox(width: 4.w),
                                  const CustomText(
                                    text: "4.9",
                                    color: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                              CustomText(
                                text: controller
                                        .singleShopModel?.data?.businessName ??
                                    controller.singleShopModel?.data?.name ??
                                    "",
                                color: AppColors.white50,
                                fontSize: 20.sp,
                              ),
                              CustomText(
                                text: AppString.giveRating,
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                              ),
                            ],
                          ),
                          Align(
                              alignment: FractionalOffset.centerLeft,
                              child: CustomText(
                                text: AppString.description,
                                fontSize: 20.sp,
                                color: AppColors.white50,
                                fontWeight: FontWeight.w600,
                                top: 24.h,
                              )),
                          CustomText(
                            text: controller.singleShopModel?.data
                                    ?.businessDescription ??
                                "",
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w300,
                            fontSize: 12.sp,
                            color: AppColors.white50,
                            bottom: 13.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    size: 16.sp,
                                    color: AppColors.white50,
                                  ),
                                  CustomText(
                                    text: controller.singleShopModel?.data
                                            ?.businessNumber ??
                                        controller.singleShopModel?.data
                                            ?.phoneNumber ??
                                        "",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.white50,
                                    left: 8.w,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.mail_outline_rounded,
                                    size: 16.sp,
                                    color: AppColors.white50,
                                  ),
                                  CustomText(
                                    text: controller.singleShopModel?.data
                                            ?.businessEmail ??
                                        controller
                                            .singleShopModel?.data?.email ??
                                        "",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                    color: AppColors.white50,
                                    left: 8.w,
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          switch (controller.productStatus) {
                            Status.loading => const SizedBox(
                                height: 200, child: CustomLoader()),
                            Status.error => SizedBox(
                                height: 200,
                                child: ErrorScreen(
                                  onTap: () => controller.productsRepo(userId),
                                ),
                              ),
                            Status.completed => controller.products.isEmpty
                                ? SizedBox(height: 200.h, child: const NoData())
                                : GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisExtent: 190.sp,
                                            mainAxisSpacing: 10.h),
                                    itemCount: controller.products.length,
                                    itemBuilder: (context, index) {
                                      Data item = controller.products[index];
                                      return GestureDetector(
                                        onTap: () => Get.toNamed(
                                            AppRoute.productDetails,
                                            parameters: {
                                              "productId": item.sId!
                                            }),
                                        child: HomeProductItem(
                                          onTap: () {
                                            controller.isFavoriteRepo(index);
                                          },
                                          image:
                                              "${AppUrl.imageUrl}/${item.image?.path ?? ""}",
                                          title: item.name ?? "",
                                          subTitle: item.description ?? "",
                                          isFavorite: item.isFavorite != null &&
                                                  item.isFavorite!
                                              ? item.isFavorite!
                                              : false,
                                        ),
                                      );
                                    },
                                  ),
                          },
                        ],
                      ),
                    ),
                  )
                ],
              ),
          };
        },
      ),
    );
  }
}
