import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/product/product_details_controller.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/custom_loader.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';


import 'inner_widget/place_order.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductDetailsController controller = Get.put(ProductDetailsController());

  String productId = Get.parameters["productId"] ?? "";

  @override
  void initState() {
    controller.productRepo(productId: productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("ProductId $productId");
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
          leading: const AppbarIcon(),
          title: CustomText(
            text: "Menu Details",
            fontSize: 24.sp,
            color: AppColors.white50,
            fontWeight: FontWeight.w600,
          )),
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) {
          return switch (controller.status) {
            Status.loading => const CustomLoader(),
            Status.error => ErrorScreen(
                onTap: () => controller.productRepo(productId: productId),
              ),
            Status.completed => Stack(
                children: [
                  CustomImage(
                    imageSrc:
                        "${AppUrl.imageUrl}/${controller.productDetailsModel?.data?.image?.path ?? ""}",
                    height: 340.h,
                    width: Get.width,
                    fill: BoxFit.fill,
                    imageType: ImageType.decorationImage,
                  ),
                  PlaceOrder()
                ],
              ),
          };
        },
      ),
    );
  }
}
