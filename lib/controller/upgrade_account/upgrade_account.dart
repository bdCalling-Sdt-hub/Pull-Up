import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_up/controller/payment_controller.dart';

import '../../core/app_route.dart';
import '../../services/api_service.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_url.dart';

class UpgradeAccountController extends GetxController {
  bool isLoading = false;
  DateTime? startDate;
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  PaymentController paymentController = Get.put(PaymentController());

  List accountType = ['shopping', 'business', 'organisation'];
  List package = ['daily', 'weekly', 'monthly'];

  int accountIndex = 0;
  int businessAccountPackage = 0;
  int organisationAccountPackage = 0;

  String accountName = 'shopping';
  String packageDuration = 'daily';

  selectAccount(int index) {
    accountIndex = index;
    update();
    accountName = accountType[index];
    print(accountName);
  }

  selectBusinessPackage(int index) {
    businessAccountPackage = index;
    update();
    packageDuration = package[index];
    print(packageDuration);
  }

  selectOrganisationPackage(int index) {
    organisationAccountPackage = index;
    update();
    packageDuration = package[index];
    print(packageDuration);
  }

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
      dateController.text = picked.toIso8601String();
    }
    update();
  }

  Future<void> upgradedAccountRepo() async {
    isLoading = true;
    update();

    var body = {
      "accountType": accountName,
      "location": addressController.text,
      "packageDuration": packageDuration,
      "activationDate": dateController.text,
      "mapLocation":
          jsonEncode({"longitude": 6.84099664391005, "latitude": 47.64532465})
    };

    print("======================================> body $body");
    var response = await ApiService.postApi(
      AppUrl.upgradedAccount,
      body,
    );

    print(
        "======================================> body ${response.statusCode}");
    print("======================================> body ${response.body}");
    if (response.statusCode == 200) {
      Get.toNamed(AppRoute.ticketPayment);
      paymentController.makePayment();

    }
    isLoading = false;
    update();
  }
}
