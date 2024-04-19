import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../widget/navBar/navbar.dart';
import 'inner_widget/income_item.dart';

class Income extends StatefulWidget {
  Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  String _selectedChoice = 'This Month';
  String incomeListChoice = 'This Week';

  final List<String> _choices = ['This Month', 'This Week', 'This Day'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: CustomText(
          text: AppString.income,
          color: AppColors.white50,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: AppString.goodMorning,
              color: AppColors.white50,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: 'Hi, Benjamin Evalent',
              color: AppColors.deepOrange,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
            Container(
              height: 127.h,
              margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: AppColors.deepOrange,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: AppString.currentBalance,
                        color: AppColors.white50,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      const Spacer(),
                      DropdownButton<String>(
                        dropdownColor: AppColors.background,
                        value: _selectedChoice,
                        style: const TextStyle(color: AppColors.white50),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedChoice = newValue!;
                          });
                        },
                        items: _choices
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  CustomText(
                    text: '\$431,324.00',
                    color: AppColors.white50,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
            ),
            Row(
              children: [
                CustomText(
                  text: AppString.incomeList,
                  color: AppColors.white50,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
                const Spacer(),
                DropdownButton<String>(
                  dropdownColor: AppColors.background,
                  value: incomeListChoice,
                  style: const TextStyle(color: AppColors.white50),
                  onChanged: (newValue) {
                    setState(() {
                      incomeListChoice = newValue!;
                    });
                  },
                  items: _choices.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return IncomeItem(
                    title: 'Merry Company',
                    subTitle: '14.08.2022 | 08pm | Subscribe',
                    image: AppImages.merry,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:  CustomBottomNavBar(
        currentIndex: 4,
      ),
    );
  }
}
