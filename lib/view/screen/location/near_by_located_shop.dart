import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/location/near_by_location_shop_controller.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/near_by_shop_model.dart';
import 'package:pull_up/utils/app_colors.dart';

import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/custom_loader.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/no_data.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';
import '../../widget/navBar/navbar.dart';
import 'inner_widget/located_gridview_item.dart';

class NearByLocatedShop extends StatefulWidget {
  const NearByLocatedShop({super.key});

  @override
  State<NearByLocatedShop> createState() => _NearByLocatedShopState();
}

class _NearByLocatedShopState extends State<NearByLocatedShop> {
  String latitude = Get.parameters["latitude"] ?? "";

  String longitude = Get.parameters["longitude"] ?? "";

  NearbyLocationShopController controller =
      Get.put(NearbyLocationShopController());

  @override
  void initState() {
    controller.nearbyShopRepo(latitude: latitude, longitude: longitude);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.nearbyShop,
          color: AppColors.white50,
          textAlign: TextAlign.start,
          fontSize: 24.sp,
        ),
        actions: [
          GestureDetector(
            child: const Icon(
              Icons.favorite,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            width: 28.w,
          ),
        ],
      ),
      body: GetBuilder<NearbyLocationShopController>(
        builder: (controller) {
          return switch (controller.status) {
            Status.loading => const CustomLoader(),
            Status.error => ErrorScreen(
                onTap: () => controller.nearbyShopRepo(
                    latitude: latitude, longitude: longitude),
              ),
            Status.completed => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                child: controller.shops.isEmpty
                    ? const NoData()
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.h,
                            mainAxisExtent: 160.h,
                            crossAxisSpacing: 8.w),
                        itemCount: controller.shops.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          Data item = controller.shops[index];
                          return GestureDetector(
                            onTap: () => Get.toNamed(AppRoute.shopHouse,
                                parameters: {"userId": item.sId.toString()}),
                            child: LocatedGridviewItem(
                              image:
                                  "${AppUrl.imageUrl}/${item.image?.path ?? ""}",
                              title: item.businessName ?? item.name ?? "",
                              subTitle: item.businessDescription ?? "",
                            ),
                          );
                        },
                      ),
              ),
          };
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
