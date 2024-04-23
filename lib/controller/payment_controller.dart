import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_up/utils/app_url.dart';

import '../services/api_service.dart';
import '../utils/payment_key.dart';

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;
  bool isLoading = false;

  String bagId = "66093284e10be8c06418c7db";
  String amount = "6";
  String currency = "USD";
  String oderId = "";

  Future<void> makePayment() async {
    isLoading = true;
    update();
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          // billingDetails: const BillingDetails(
          //     name: 'Naimul Hassan',
          //     email: 'developernaimul00@gmail.com',
          //     address: Address(
          //         city: 'Dhaka',
          //         country: 'Bangladesh',
          //         line1: 'Dhaka',
          //         line2: 'Dhaka',
          //         postalCode: '1121',
          //         state: 'Dhaka')),
          googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
          merchantDisplayName: 'United App',
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
    isLoading = true;
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
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      isLoading = false;
      update();
      // stripeCheckPaymentIntentTransaction(paymentIntentData!['client_secret']);
      // retrieveTxnId(paymentIntent: paymentIntentData!['id']);
      // paymentRepo();
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
//   isLoading = true;
//   update();
//
//   var body = {
//     "jsonEncoded":
//     jsonEncode({"bagId": bagId, "stripeData": paymentIntentData})
//   };
//
//   var response = await ApiService.postApi(AppUrl.purchaseBag, body);
//
//   if(response.statusCode == 200) {
//     Utils.toastMessage(response.message);
//     oderId = jsonDecode(response.responseJson)['data']["_id"] ;
//     print("==========================================================oderId $oderId");
//     Get.toNamed(AppRoute.orderDoneScreen);
//   } else {
//     Utils.toastMessage(response.message);
//   }
//
//   print(response.statusCode);
//   print(response.responseJson);
//
//   isLoading = false;
//   update();
// }
}
