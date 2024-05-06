import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/upgrade_account/upgrade_account.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/screen/profile/upgrade_account/inner_widget/feature_item.dart';
import 'package:pull_up/view/screen/profile/upgrade_account/inner_widget/location_popup.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../../widget/button/custom_button.dart';
import 'activation_time.dart';

class ShoppingAccount extends StatelessWidget {
  const ShoppingAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpgradeAccountController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.whatYouGet,
              color: AppColors.white50,
              top: 14.h,
              bottom: 14.h,
              fontWeight: FontWeight.w600,
            ),
            FeatureItem(
                title: AppString.signUp,
                subTitle:
                    AppString.youCanCreateFreeAccountAndSetUpYourBusiness),
            FeatureItem(
                title: AppString.locatorUse,
                subTitle: AppString.youCanUseTheLocatorOnceInHoursFor),
            FeatureItem(
                title: AppString.locationOrPins,
                subTitle:
                    AppString.youCanOnlyShowPinnedOrAddressAndLiveLocation),
            FeatureItem(
                title: AppString.favorBusinessesOrKeywords,
                subTitle: AppString.youCanFavorBusinessesOrKeywords),
            FeatureItem(
                title: AppString.rateBusiness,
                subTitle: AppString.youCanRateBusinesses),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              titleText: AppString.activateTheLocator,
              onPressed: () => LocationPopUp.getLocation(),
            )
          ],
        );
      },
    );
  }
}
