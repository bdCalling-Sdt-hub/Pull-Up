import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/screen/profile/upgrade_account/inner_widget/activation_time.dart';
import 'package:pull_up/view/screen/profile/upgrade_account/inner_widget/feature_item.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../../../widget/button/custom_button.dart';

class BusinessAccount extends StatefulWidget {
  BusinessAccount({super.key});

  @override
  State<BusinessAccount> createState() => _BusinessAccountState();
}

class _BusinessAccountState extends State<BusinessAccount> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
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
            subTitle: AppString.youCanCreateFreeAccountAndSetUpYourBusiness),
        FeatureItem(
            title: AppString.locatorUse,
            subTitle: AppString.youCanUseTheLocatorOnceInHoursFor),
        FeatureItem(
            title: AppString.locationOrPins,
            subTitle: AppString.youCanOnlyShowPinnedOrAddressAndLiveLocation),
        FeatureItem(
            title: AppString.favorBusinessesOrKeywords,
            subTitle: AppString.youCanFavorBusinessesOrKeywords),
        FeatureItem(
            title: AppString.rateBusiness,
            subTitle: AppString.youCanRateBusinesses),
        FeatureItem(
            title: AppString.adFree,
            subTitle: AppString.byUpgradingToBusinessYouWillGetNoAd),
        FeatureItem(
            title: AppString.customizeProfile,
            subTitle: AppString.byUpgradingBusinessYouCanCustomizeYourProfile),
        FeatureItem(
            title: AppString.businessRating,
            subTitle: AppString
                .byUpgradingBusinessYouCanGetYourBusinessRatedByOtherUsers),
        FeatureItem(
            title: AppString.businessSchedule,
            subTitle: AppString
                .byUpgradingBusinessYouCanSelectStartAndCloseTimeForYourTimeOnWeeklyAndMonthlyBases),
        Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  index = 0;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: index == 0
                          ? AppColors.primaryColor
                          : AppColors.grey300,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r))),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  child: const Column(
                    children: [
                      CustomText(
                          text: AppString.dailyPackage,
                          color: AppColors.white50,
                          fontSize: 10),
                      CustomText(
                          text: "\$1.99",
                          color: AppColors.white50,
                          fontSize: 12)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  index = 1;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        index == 1 ? AppColors.primaryColor : AppColors.grey300,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  child: const Column(
                    children: [
                      CustomText(
                          text: AppString.weeklyPackage,
                          color: AppColors.white50,
                          fontSize: 10),
                      CustomText(
                          text: "\$5.99",
                          color: AppColors.white50,
                          fontSize: 12)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  index = 2;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: index == 2
                          ? AppColors.primaryColor
                          : AppColors.grey300,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r))),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  child: const Column(
                    children: [
                      CustomText(
                          text: AppString.monthlyPackage,
                          color: AppColors.white50,
                          fontSize: 10),
                      CustomText(
                          text: "\$17.99",
                          color: AppColors.white50,
                          fontSize: 12)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 28.h,),
        CustomButton(
          titleText: AppString.next,
          onPressed: () => ActivationTime.getActivationTime(),
        )
      ],
    );
  }
}
