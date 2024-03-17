import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import 'inner_widget/place_order.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const AppbarIcon(),
          title: CustomText(
            text: "Menu Details",
            fontSize: 24.sp,
            color: AppColors.white50,
            fontWeight: FontWeight.w600,
          )),
      body: Stack(
        children: [
          Container(
            height: 340.h,
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
              color: AppColors.white50,
              image: const DecorationImage(
                  image: AssetImage(AppImages.book), fit: BoxFit.fill),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
            ),
          ),
          PlaceOrder()
        ],
      ),
    );
  }
}
