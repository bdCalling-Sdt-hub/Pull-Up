import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/view/screen/profile/upgrade_account/inner_widget/profile_info.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/text/custom_text.dart';

class UpgradeAccount extends StatelessWidget {
  const UpgradeAccount({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.upgradeAccount,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            ProfileInfo(title: 'Jackson Paul', image: AppImages.profile1, subTitle: AppString.shoppingAccount)
          ],
        ),
      ),
    );
  }
}
