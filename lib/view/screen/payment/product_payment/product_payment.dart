import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';
import '../../../../../utils/app_images.dart';
import 'inner_widget/add_payment_method.dart';

class Productpayment extends StatelessWidget {
  Productpayment({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          Container(
            height: 240.h,
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
          const AddPaymentMethod()
        ],
      ),
    );
  }
}
