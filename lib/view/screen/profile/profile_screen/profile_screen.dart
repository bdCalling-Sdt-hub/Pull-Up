import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';
import 'package:pull_up/helper/prefs_helper.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/view/screen/profile/profile_screen/inner_widget/boost_bussness.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/navBar/navbar.dart';

import '../../../../core/app_route.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/item.dart';
import '../../../widget/text/custom_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    controller.profileRepo();
    super.initState();
  }

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
            child: InkWell(
                onTap: () {
                  showDialog(
                    context: Get.context!,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(AppString.areYouSure),
                        actions: [
                          TextButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    AppColors.deepOrange),
                              ),
                              onPressed: () {
                                PrefsHelper.removeAllPrefData();
                              },
                              child: const Text(
                                AppString.yes,
                                style: TextStyle(color: AppColors.white50),
                              )),
                          TextButton(
                              style: const ButtonStyle(
                                side: MaterialStatePropertyAll(
                                  BorderSide(color: AppColors.grey900),
                                ),
                                // backgroundColor: MaterialStatePropertyAll(AppColors.blue_500),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                AppString.no,
                                style: TextStyle(color: AppColors.grey900),
                              )),
                        ],
                      );
                    },
                  );
                },
                child: CustomImage(imageSrc: AppIcons.logOut)),
          )
        ],
      ),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return switch (controller.status) {
            Status.loading => const Center(child: CircularProgressIndicator()),
            Status.error => ErrorScreen(
                onTap: () => controller.profileRepo(),
              ),
            Status.completed => SingleChildScrollView(
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
                                imageSrc:
                                    "${AppUrl.imageUrl}/${controller.profileModel?.data?.image?.path ?? ""}",
                                imageType: ImageType.network,
                                height: 100,
                                width: 100,
                                defaultImage: AppImages.defaultProfile,
                              ),
                            ))),
                    CustomText(
                      text:  controller.profileModel?.data?.name ?? "",
                      color: AppColors.white50,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      top: 8.h,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Get.toNamed(AppRoute.editProfile),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
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
                      ),
                    ),
                    BoostBusiness(
                        title: AppString.phone,
                        subTitle: controller.profileModel?.data?.phoneNumber ?? "",
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
                      title: PrefsHelper.mySubscription == "business"
                          ? AppString.myProduct
                          : PrefsHelper.mySubscription == "organisation"
                              ? AppString.myEvent
                              : "",
                      icon: AppIcons.addMenu,
                      onTap: () => Get.toNamed(AppRoute.myProduct),
                    ),
                    Item(
                      title: AppString.income,
                      icon: AppIcons.income,
                      onTap: () => Get.toNamed(AppRoute.income),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 4),
    );
  }
}
