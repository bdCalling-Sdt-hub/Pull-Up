import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/button/custom_button.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';
import '../../../widget/profile/profile_image.dart';
import '../../../widget/text/custom_text.dart';
import 'inner_widget/edit_profile_all_field.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.profile,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 24.h),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            const ProfileImage(imageURl: AppImages.profile1,),
            CustomText(
              text: 'Jackson Paul',
              color: AppColors.white50,
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              top: 8.h,
            ),
            EditProfileAllField(),
            SizedBox(
              height: 12.h,
            ),
            CustomButton(
              titleText: AppString.save,
              onPressed: () => Get.back(),
            )
          ],
        ),
      ),
    );
  }
}
