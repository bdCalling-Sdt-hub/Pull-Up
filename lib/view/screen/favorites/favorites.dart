import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/favorite_controller.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/favorite_model.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/custom_loader.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/no_data.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../widget/navBar/navbar.dart';
import 'inner_widget/favorites_item.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  FavoriteController controller = Get.put(FavoriteController());

  @override
  void initState() {
    controller.page = 1;
    controller.favoriteRepo();
    controller.scrollController.addListener(() {
      controller.scrollControllerCall();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.favorites,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: GetBuilder<FavoriteController>(
        builder: (controller) {
          return switch (controller.status) {
            Status.loading => const CustomLoader(),
            Status.error => ErrorScreen(
                onTap: () {
                  controller.page = 1;
                  controller.favoriteRepo();
                },
              ),
            Status.completed => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: controller.favorites.isEmpty
                    ? const NoData()
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: controller.scrollController,
                        itemCount: controller.favorites.length,
                        itemBuilder: (context, index) {
                          Result item = controller.favorites[index];
                          return FavoritesItem(
                            onTap: () => controller.removeFavorite(index),
                            title: item.productId?.name ?? "",
                            subTitle: item.productId?.description ?? "",
                            image:
                                "${AppUrl.imageUrl}/${item.productId?.image?.path ?? ""}",
                          );
                        },
                      ),
              )
          };
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 6,
      ),
    );
  }
}
