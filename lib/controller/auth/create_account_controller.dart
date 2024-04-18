import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/utils/app_utils.dart';

import '../../core/app_route.dart';
import '../../services/api_service.dart';

class CreateAccountController extends GetxController {
  bool isLoading = false;
  bool isLoadingVerify = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmControllerController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp passRegExp = RegExp(r'(?=.*[a-z])(?=.*[0-9])');

  Future<void> createUserRepo() async {
    isLoading = true;
    update();

    Map<String, String> body = {
      "name": nameController.text,
      "email": emailController.text,
      "phoneNumber": numberController.text,
      "password": passwordController.text,
      "role": "user"
    };

    var response = await ApiService.postApi(
      AppUrl.signUp,
      body,
    );

    print("===========${response.statusCode}===========");

    if (response.statusCode == 200) {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
      Get.toNamed(AppRoute.emailVerify);
    } else if (response.statusCode == 409) {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
      Get.toNamed(AppRoute.login);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  Future<void> verifyEmailRepo() async {
    isLoadingVerify = true;
    update();

    Map<String, String> body = {
      "email": emailController.text,
      "oneTimeCode": otpController.text
    };

    print(body);

    var response = await ApiService.postApi(
      AppUrl.verifyEmail,
      body,
    );

    print("===========${response.statusCode}===========");

    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoute.login);
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoadingVerify = false;
    update();
  }
}
