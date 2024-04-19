import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/view/screen/profile/upgrade_account/inner_widget/profile_info.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/text/custom_text.dart';
import 'inner_widget/account_button.dart';
import 'inner_widget/business_account.dart';
import 'inner_widget/organisation _account.dart';
import 'inner_widget/shopping_Account.dart';
import 'inner_widget/subscription_activate.dart';

class UpgradeAccount extends StatefulWidget {
  UpgradeAccount({super.key});

  @override
  State<UpgradeAccount> createState() => _UpgradeAccountState();
}

class _UpgradeAccountState extends State<UpgradeAccount> {
  int index = 0;

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            ProfileInfo(
                title: 'Jackson Paul',
                image: AppImages.profile1,
                subTitle: AppString.shoppingAccount),
            SubscriptionActivate(
              title: 'Subscription is Activated',
              subTitle: '12 hours 34 minutes left',
            ),
            SizedBox(
              width: 12.h,
            ),
            Row(
              children: [
                Expanded(
                    child: AccountButton(
                        title: AppString.shoppingAccount,
                        color: index == 0
                            ? AppColors.primaryColor
                            : AppColors.transparent,
                        onTap: () {
                          index = 0;
                          setState(() {});
                        })),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                    child: AccountButton(
                        title: AppString.businessAccount,
                        color: index == 1
                            ? AppColors.primaryColor
                            : AppColors.transparent,
                        onTap: () {
                          index = 1;
                          setState(() {});
                        })),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                    child: AccountButton(
                        title: AppString.organizationAccount,
                        color: index == 2
                            ? AppColors.primaryColor
                            : AppColors.transparent,
                        onTap: () {
                          index = 2;
                          setState(() {});
                        })),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: index == 0
                    ? const ShoppingAccount()
                    : index == 1
                        ? BusinessAccount()
                        : OrganisationAccount()),

          ],
        ),
      ),
      bottomNavigationBar:  CustomBottomNavBar(currentIndex: 4),
    );
  }
}
