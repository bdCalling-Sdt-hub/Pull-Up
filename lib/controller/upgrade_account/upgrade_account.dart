import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class UpgradeAccountController extends GetxController {
  DateTime? startDate;
  TextEditingController dateController = TextEditingController();

  Future<void> validationTimePicker() async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor,
            onPrimary: AppColors.white50,
            onSurface: AppColors.grey900,
          ),
        ),
        child: child!,
      ),
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      // First click, set the start date
      startDate = picked;
      dateController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
    update();
  }
}
