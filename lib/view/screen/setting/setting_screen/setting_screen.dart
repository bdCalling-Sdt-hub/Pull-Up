import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/helper/prefs_helper.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/item.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import 'inner_widget/clear_history_popup.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final controller = ValueNotifier<bool>(PrefsHelper.isNotifications);

  @override
  void initState() {
    controller.addListener(() {
      PrefsHelper.isNotifications = controller.value;
      PrefsHelper.setBool("isNotifications", PrefsHelper.isNotifications);
    });
    super.initState();
  }

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
                AdvancedSwitch(
                  height: 24.h,
                  width: 48.w,
                  controller: controller,
                  activeColor: AppColors.primaryColor,
                  initialValue: PrefsHelper.isNotifications,
                ),
              ],
            ),
            Item(
              title: AppString.clearHistory,
              icon: AppIcons.cleanHistory,
              onTap: () => ClearPopUp.clearHistoryPopUp(),
            ),
            // Item(
            //   title: AppString.distanceUnits,
            //   icon: AppIcons.distanceUnits,
            //   onTap: () => DistancePopUp.distanceUnitsPopUp(),
            // ),
            Item(
                title: AppString.deactivateAccount,
                onTap: () => Get.toNamed(AppRoute.deactiveateAccount),
                icon: AppIcons.deactivate)
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    );
  }
}
