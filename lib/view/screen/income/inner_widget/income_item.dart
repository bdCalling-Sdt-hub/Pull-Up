
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_icons.dart';
import '../../../widget/custom_image.dart';
import '../../../widget/text/custom_text.dart';
import '../../notification/inner_widget/delete_popup.dart';

class IncomeItem extends StatelessWidget {
  const IncomeItem({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
