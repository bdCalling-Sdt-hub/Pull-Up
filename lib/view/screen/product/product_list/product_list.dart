import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/view/screen/product/product_list/inner_widget/product_item.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/text/custom_text.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.menu,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          GestureDetector(
            onTap:() => Get.toNamed(AppRoute.addProduct),
            child: CustomText(
              text: AppString.addNewProduct,
              color: AppColors.white50,
              right: 30.w,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            CustomButton(
              titleText: AppString.createDeal,
              onPressed: () => Get.toNamed(AppRoute.addDeal),
            ),
            SizedBox(height: 25.h,),
            Expanded(
                child: ListView.builder(
                  itemCount: 4,
              itemBuilder: (context, index) {
                return ProductItem(title: "Cheese Burger", subTitle: "This is the Cheese burger with loaded cheese", image: AppImages.burger, price: "10.99",) ;
              },
            ))
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }
}
