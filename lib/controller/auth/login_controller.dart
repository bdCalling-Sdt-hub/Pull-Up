import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/utils/app_utils.dart';

import '../../core/app_route.dart';
import '../../services/api_service.dart';

class LoginController extends GetxController {
  bool isLoading = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp passRegExp = RegExp(r'(?=.*[a-z])(?=.*[0-9])');

  Future<void> logInRepo() async {
    isLoading = true;
    update();

    Map<String, String> body = {
      "email": emailController.text,
      "password": passwordController.text
    };

    var response = await ApiService.postApi(
      AppUrl.signIn,
      body,
    );

    print("===========${response.statusCode}===========");

    if (response.statusCode == 200) {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
      Get.offAllNamed(AppRoute.home);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }
}
