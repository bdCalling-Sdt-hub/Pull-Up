
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../utils/app_images.dart';
import 'custom_image.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImage(
            imageSrc: AppImages.noData,
            imageType: ImageType.png,
            size: 70.sp,
          ),
          CustomText(
            text: AppString.noData,
            fontSize: 16.h,
            top: 8.h,
          )
        ],
      ),
    );
  }
}

class AppStrings {
}