import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:pull_up/helper/prefs_helper.dart';
import 'package:pull_up/model/login_model.dart';
import 'package:pull_up/services/location_service.dart';
import '../../core/app_route.dart';
import '../../services/api_service.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';
import '../../utils/payment_key.dart';
import 'package:http/http.dart' as http;

class UpgradeAccountController extends GetxController {
  bool isLoading = false;

  Map<String, dynamic>? paymentIntentData;
  bool isLoadingPayment = false;

  DateTime? startDate;
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  LogInModel? logInModel;

  List accountType = ['shopping', 'business', 'organisation'];
  List package = ['daily', 'weekly', 'monthly'];
  List packageAmount = ['1.99', '5.99', '17.99'];

  int accountIndex = 0;
  int businessAccountPackage = 0;
  int organisationAccountPackage = 0;

  String accountName = 'shopping';
  String packageDuration = 'daily';
  String amount = '1.99';
  String currency = "USD";

  selectAccount(int index) {
    accountIndex = index;
    update();
    accountName = accountType[index];
  }

  selectBusinessPackage(int index) {
    businessAccountPackage = index;
    update();
    packageDuration = package[index];
    amount = packageAmount[index];
  }

  selectOrganisationPackage(int index) {
    organisationAccountPackage = index;
    update();
    packageDuration = package[index];
    amount = packageAmount[index];
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

  Future<void> stripePayment() async {
    Get.toNamed(AppRoute.ticketPayment);
    makePayment();
  }

  Future<void> upgradedAccountRepo() async {
    isLoading = true;
    update();

    List locations =
        await LocationService.addressToCoordinate(addressController.text);

    var body = {
      "accountType": accountName,
      "location": addressController.text,
      "packageDuration": packageDuration,
      "activationDate": dateController.text,
      "mapLocation": jsonEncode({
        "longitude": locations.first.longitude,
        "latitude": locations.first.latitude
      })
    };

    var response = await ApiService.postApi(
      AppUrl.upgradedAccount,
      body,
    );

    if (response.statusCode == 200) {
      PrefsHelper.mySubscription =
          jsonDecode(response.body)["data"]["accountType"];
      PrefsHelper.setString("mySubscription", PrefsHelper.mySubscription);

      Get.offAllNamed(AppRoute.editProfile);
    }
    isLoading = false;
    update();
  }

  Future<void> makePayment() async {
    isLoading = true;
    update();
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
          merchantDisplayName: 'Pull Up App',
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          style: ThemeMode.dark,
        ));
        displayPaymentSheet();
        if (kDebugMode) {
          print("----------display payment sheet didn't called");
        }
      }
    } catch (e, s) {
      if (kDebugMode) {
        print(
            '-=-=-=-=-=-=-=---=-=-=-exception: $e $s =-=-=-=-=--=-=-=-=-=-=-=');
      }
    }
  }

  createPaymentIntent(String amount, String currency) async {
    isLoadingPayment = true;
    update();
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      var response = await http
          .post(Uri.parse(PaymentKey.paymentIntent), body: body, headers: {
        'Authorization': 'Bearer ${PaymentKey.secretKey}',
        'Content-Type': 'application/x-www-form-urlencoded'
      });
      if (kDebugMode) {
        print(
            "=============>>>${response.body}----${response.statusCode}<<<==================");
      }

      return jsonDecode(response.body);
    } catch (e) {
      if (kDebugMode) {
        print("Error Occurred:======================> ${e.toString()}");
      }
    }
  }

  calculateAmount(String amount) {
    dynamic a = (double.parse(amount)) * 100;
    a = a.floor();
    return a.toString();
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      isLoadingPayment = false;
      update();
      paymentRepo();
      if (kDebugMode) {
        print('payment intent$paymentIntentData');
      }
    } catch (e) {
      if (kDebugMode) {
        print("error $e");
      }
    }
  }

  Future<void> paymentRepo() async {
    isLoading = true;
    update();

    var body = {
      "userAccountType": accountName,
      "packageDuration": packageDuration,
      "data": jsonEncode(paymentIntentData)
    };

    var response = await ApiService.postApi(AppUrl.payment, body);

    if (response.statusCode == 200) {
      Utils.toastMessage(message: response.message);
      upgradedAccountRepo();
    } else {
      Utils.toastMessage(message: response.message);
    }

    isLoading = false;
    update();
  }
}
