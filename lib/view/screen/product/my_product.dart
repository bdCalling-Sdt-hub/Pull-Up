import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/product/product_list_controller.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/product_model.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/screen/product/product_list/inner_widget/product_item.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';
import 'package:pull_up/view/widget/no_data.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../controller/product/my_product_controller.dart';
import '../../widget/text/custom_text.dart';

class MyProduct extends StatefulWidget {
  MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  MyProductController controller = Get.put(MyProductController());

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        controller.page = 1;
        controller.productsRepo();
        controller.scrollController.addListener(() {
          controller.scrollControllerCall();
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.myProduct,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed(AppRoute.addProduct),
            child: CustomText(
              text: AppString.addNewProduct,
              color: AppColors.white50,
              right: 30.w,
            ),
          )
        ],
      ),
      body: GetBuilder<MyProductController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // account == "shopping"
                //     ? const SizedBox()
                //     : CustomButton(
                //         titleText: AppString.createDeal,
                //         onPressed: () => Get.toNamed(AppRoute.addDeal),
                //       ),
                switch (controller.status) {
                  Status.loading =>
                    const Center(child: CircularProgressIndicator()),
                  Status.error => ErrorScreen(
                      onTap: () {
                        controller.page = 1;
                        controller.productsRepo();
                      },
                    ),
                  Status.completed => controller.products.isEmpty
                      ? const NoData()
                      : Expanded(
                          child: ListView.builder(
                            itemCount: controller.products.length,
                            controller: controller.scrollController,
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              Result item = controller.products[index];
                              return ProductItem(
                                title: item.name ?? "",
                                subTitle: item.description ?? "",
                                image: "${AppUrl.imageUrl}/${item.image?.path}",
                                price: item.price ?? " ",
                              );
                            },
                          ),
                        ),
                }
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
