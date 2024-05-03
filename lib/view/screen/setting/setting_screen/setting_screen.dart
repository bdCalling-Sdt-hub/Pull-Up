import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/item.dart';
import 'package:pull_up/view/screen/setting/setting_screen/inner_widget/sistance_units_popup.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import 'inner_widget/clear_history_popup.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.settings,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: AppColors.white50,
                  size: 28.sp,
                ),
                CustomText(
                  text: AppString.pushNotifications,
                  color: AppColors.white50,
                  left: 8.w,
                ),
                const Spacer(),
                Switch(
                    value: isSwitch,
                    activeColor: AppColors.background,
                    activeTrackColor: AppColors.primaryColor,
                    onChanged: (value) {
                      isSwitch = value;
                      setState(() {});
                    })
              ],
            ),
            Item(
              title: AppString.clearHistory,
              icon: AppIcons.cleanHistory,
              onTap: () => ClearPopUp.clearHistoryPopUp(),
            ),
            Item(
              title: AppString.distanceUnits,
              icon: AppIcons.distanceUnits,
              onTap: () => DistancePopUp.distanceUnitsPopUp(),
            ),
            Item(
                title: AppString.deactivateAccount,
                onTap: () => Get.toNamed(AppRoute.deactiveateAccount),
                icon: AppIcons.deactivate)
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 3),
    );
  }
}
