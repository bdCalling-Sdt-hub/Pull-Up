import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_string.dart';
import '../../../../widget/text/custom_text.dart';
import '../../../../widget/text_field/custom_text_field.dart';

class CreateAccountAllField extends StatelessWidget {
  const CreateAccountAllField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        CustomText(
          text: AppString.createAccount,
          fontSize: 24.sp,
          bottom: 23.h,
        ),
        const CustomTextField(
          labelText: AppString.businessName,
        ),
        SizedBox(height: 20.h,),
        const CustomTextField(
          labelText: AppString.email,
        ),
        SizedBox(height: 20.h,),
        const CustomTextField(
          labelText: AppString.phoneNumber,
        ),
        SizedBox(height: 20.h,),
        const CustomTextField(
          labelText: AppString.password,
          isPassword: true,
        ),
        SizedBox(height: 20.h,),
        const CustomTextField(
          labelText: AppString.confirmPassword,
          isPassword: true,
        ),
        SizedBox(height: 20.h,),

      ],
    );
  }
}
