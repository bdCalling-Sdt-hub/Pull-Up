import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/income_controller.dart';
import 'package:pull_up/helper/prefs_helper.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/income_model.dart';
import 'package:pull_up/utils/app_colors.dart';
import 'package:pull_up/utils/app_images.dart';
import 'package:pull_up/utils/app_string.dart';
import 'package:pull_up/view/widget/appbar_icon/appbar_icon.dart';
import 'package:pull_up/view/widget/custom_loader.dart';
import 'package:pull_up/view/widget/error_screen.dart';
import 'package:pull_up/view/widget/no_data.dart';
import 'package:pull_up/view/widget/text/custom_text.dart';

import '../../widget/navBar/navbar.dart';
import 'inner_widget/income_item.dart';

class Income extends StatefulWidget {
  Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  IncomeController controller = Get.put(IncomeController());

  @override
  void initState() {
    controller.currentBalance("This Month");
    super.initState();
  }

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
      body: GetBuilder<IncomeController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: controller.getGreeting(),
                  color: AppColors.white50,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: PrefsHelper.myName,
                  color: AppColors.deepOrange,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.start,
                  maxLines: 1,
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
                            value: controller.selectedChoice,
                            iconEnabledColor: AppColors.white50,
                            iconSize: 24.sp,
                            style: TextStyle(
                                color: AppColors.white50, fontSize: 16.sp),
                            onChanged: (value) {
                              if (value != null) {
                                controller.currentBalance(value);
                              }
                            },
                            items: controller.choices
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
                        text: '\$${controller.totalIncome}',
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
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                    child: switch (controller.status) {
                  Status.loading => const CustomLoader(),
                  Status.error => ErrorScreen(
                      onTap: () =>
                          controller.currentBalance(controller.selectedChoice),
                    ),
                  Status.completed => controller.incomes.isEmpty
                      ? const NoData()
                      : ListView.builder(
                          itemCount: controller.incomes.length,
                          itemBuilder: (context, index) {
                            Data item = controller.incomes[index];
                            return IncomeItem(
                              title: 'Merry Company',
                              subTitle: item.updatedAt != null
                                  ? '${item.updatedAt?.split("T")[0]} | ${item.updatedAt?.split("T")[1].split(":")[0]}:${item.updatedAt?.split("T")[1].split(":")[1]} | Subscribe'
                                  : '',
                              image: AppImages.merry,
                              amount: item.paymentData?.amount ?? 0,
                            );
                          },
                        ),
                }),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentIndex: 4,
      ),
    );
  }
}
