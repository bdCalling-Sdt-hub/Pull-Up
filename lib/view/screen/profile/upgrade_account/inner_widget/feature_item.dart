import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

class FeatureItem extends StatelessWidget {
  FeatureItem({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title ;
  final String subTitle ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, color: AppColors.white50, fontWeight: FontWeight.w600,bottom: 8.h,  textAlign: TextAlign.start,),
        CustomText(text: subTitle, color: AppColors.white50, fontWeight: FontWeight.w300,  fontSize: 12, bottom: 8.h, textAlign: TextAlign.start,)
      ],
    );
  }
}
