import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.weJustKnowThePlace,
          color: AppColors.white50,
          fontSize: 24.sp,
        ),
        actions: [
          Row(
            children: [
              CustomImage(imageSrc: AppIcons.location),
              SizedBox(
                width: 8.w,
              ),
              const Icon(
                Icons.favorite,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 28.w,
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
