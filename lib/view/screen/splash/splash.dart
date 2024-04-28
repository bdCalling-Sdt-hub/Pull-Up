import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Get.toNamed(AppRoute.enableLocation);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white50,
      body: Center(
        child: CustomImage(
            imageSrc: AppImages.splashLogo,
            imageType: ImageType.png,
            height: 162.sp,
            width: 162.sp),
      ),
    );
  }
}
