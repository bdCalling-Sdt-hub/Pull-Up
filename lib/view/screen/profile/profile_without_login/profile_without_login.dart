import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/item.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';

class ProfileWithOutLogIn extends StatelessWidget {
  const ProfileWithOutLogIn({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            SizedBox(
              height: 130.h,
            ),
            Center(
                child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.grey300,
                    child: ClipOval(
                      child: CustomImage(
                        imageSrc: AppImages.profile,
                        imageType: ImageType.png,
                        size: 80,
                      ),
                    ))),
            SizedBox(
              height: 14.h,
            ),
            CustomButton(
              titleText: AppString.signUpOrLogIn,
              onPressed: () => Get.toNamed(AppRoute.login),
              buttonColor: AppColors.background,
              buttonWidth: 218.w,
            ),
            SizedBox(
              height: 84.h,
            ),
            Item(
              title: AppString.upgradeAccount,
              icon: AppIcons.upgradeAccount,
              onTap: () => Get.toNamed(AppRoute.login),
            )
          ],
        ),
      ),
      bottomNavigationBar:  CustomBottomNavBar(currentIndex: 4),
    );
  }
}
