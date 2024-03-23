import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/view/screen/profile/profile_screen/inner_widget/boost_bussness.dart';
import 'package:pull_up/view/widget/custom_image.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';

import '../../../../core/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/button/custom_button.dart';
import '../../../widget/item.dart';
import '../../../widget/text/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.profile,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 32.w),
            child: CustomImage(imageSrc: AppIcons.logOut),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Center(
                child: CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.grey300,
                    child: ClipOval(
                      child: CustomImage(
                        imageSrc: AppImages.profile1,
                        imageType: ImageType.png,
                        size: 100,
                      ),
                    ))),
            CustomText(
              text: 'Jackson Paul',
              color: AppColors.white50,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              top: 8.h,
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  text: AppString.editProfile,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white50,
                  right: 8.w,
                ),
                CustomImage(imageSrc: AppIcons.edit)
              ],
            ),
            BoostBusiness(
                title: AppString.phone,
                subTitle: '+62 821 560 641',
                icon: AppIcons.call,
                background: AppColors.background,
                subTitleTextSize: 14,
                onTap: () {}),
            Item(
              title: AppString.upgradeAccount,
              icon: AppIcons.upgradeAccount,
              onTap: () => Get.toNamed(AppRoute.upgradeAccount),
            ),
            BoostBusiness(
                title: AppString.boostYourBusiness,
                subTitle: AppString.boostYourBusinessDetails,
                icon: AppIcons.boost,
                onTap: () {}),
            Item(
              title: AppString.addMenu,
              icon: AppIcons.addMenu,
              onTap: () => Get.toNamed(AppRoute.productList),
            ),
            Item(
              title: AppString.income,
              icon: AppIcons.income,
              onTap: () => Get.toNamed(AppRoute.income),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 4),
    );
  }
}
