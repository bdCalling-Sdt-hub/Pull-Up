import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_icons.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/screen/notification/inner_widget/delete_popup.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/image/custom_image.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../widget/navBar/navbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppString.notifications,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'A new book Store Opened Near you',
                          color: AppColors.white50,
                        ),
                        CustomText(
                          text:
                              'A new Book Store just got opened near you about 2 Km away!',
                          color: AppColors.white50,
                          fontWeight: FontWeight.w300,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        DeletePopUp.deleteItemPopUp() ;
                      },
                      icon: CustomImage(
                        imageSrc: AppIcons.delete,
                      ))
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar:  CustomBottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}
