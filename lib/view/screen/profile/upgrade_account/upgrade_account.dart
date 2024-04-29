import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';
import 'package:pull_up/controller/upgrade_account/upgrade_account.dart';
import 'package:pull_up/helper/prefs_helper.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/screen/profile/upgrade_account/inner_widget/profile_info.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
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
  const UpgradeAccount({super.key});

  @override
  State<UpgradeAccount> createState() => _UpgradeAccountState();
}

class _UpgradeAccountState extends State<UpgradeAccount> {
  ProfileController profileController = Get.put(ProfileController());
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
      body: GetBuilder<UpgradeAccountController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
            child: Column(
              children: [
                ProfileInfo(
                    title: PrefsHelper.myName,
                    image: "${AppUrl.imageUrl}/${profileController.profileModel?.data?.image?.path ?? ""}",
                    subTitle: PrefsHelper.mySubscription),
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
                      color: controller.accountIndex == 0
                          ? AppColors.primaryColor
                          : AppColors.transparent,
                      onTap: () => controller.selectAccount(0),
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: AccountButton(
                      title: AppString.businessAccount,
                      color: controller.accountIndex == 1
                          ? AppColors.primaryColor
                          : AppColors.transparent,
                      onTap: () => controller.selectAccount(1),
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: AccountButton(
                      title: AppString.organizationAccount,
                      color: controller.accountIndex == 2
                          ? AppColors.primaryColor
                          : AppColors.transparent,
                      onTap: () => controller.selectAccount(2),
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: controller.accountIndex == 0
                        ? const ShoppingAccount()
                        : controller.accountIndex == 1
                            ? BusinessAccount()
                            : OrganisationAccount()),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 4),
    );
  }
}
