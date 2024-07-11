import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_up/utils/app_string.dart';
import '../utils/app_utils.dart';
import '../utils/payment_key.dart';

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;

  bool isLoading = false;

  // String amount = "";
  String currency = "USD";

  Future<void> makePayment(String amount) async {
    if (amount == "0") {
      Utils.toastMessage(message: AppString.somethingIsWrong);
      Get.back(result: null);


      return;
    }
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        // paymentIntentData!["business"] = "business";
        // paymentIntentData!["daily"] = "daily";
        // paymentIntentData = {
        //   "business " :" business",
        //   "daily" : "daily",
        //   ...paymentIntentData!,
        // };
        // if (kDebugMode) {
        //   print("===================================>>>$paymentIntentData");
        // }
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
      update();

      Get.back(result: paymentIntentData);
      if (kDebugMode) {
        print('payment intent$paymentIntentData');
      }
    } catch (e) {
      if (kDebugMode) {
        print("error $e");
      }
    }
  }

// Future<void> paymentRepo() async {
//   var body = {"data": jsonEncode(paymentIntentData)};
//
//   var response = await ApiService.postApi(AppUrl.payment, body);
//
//   if (response.statusCode == 200) {
//     Utils.toastMessage(response.message);
//   } else {
//     Utils.toastMessage(response.message);
//   }
//
//   print(response.statusCode);
//   print(response.body);
// }
}
