import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pull_up/helper/prefs_helper.dart';
import 'package:pull_up/model/login_model.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:pull_up/utils/app_utils.dart';

import '../../core/app_route.dart';
import '../../services/api_service.dart';

class LoginController extends GetxController {
  bool isLoading = false;
  LogInModel? logInModel;

  TextEditingController emailController =
      TextEditingController(text: kDebugMode ? "jeyog41609@rartg.com" : '');

  TextEditingController passwordController =
      TextEditingController(text: kDebugMode ? "hello125" : "");

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

    if (response.statusCode == 200) {
      logInModel = LogInModel.fromJson(jsonDecode(response.body));
      PrefsHelper.token = logInModel?.data?.accessToken ?? "";
      PrefsHelper.userId = logInModel?.data?.user?.sId ?? "";
      PrefsHelper.myEmail = logInModel?.data?.user?.email ?? "";
      PrefsHelper.myName = logInModel?.data?.user?.name ?? "";
      PrefsHelper.isLogIn = true;

      PrefsHelper.setString('token', PrefsHelper.token);
      PrefsHelper.setString('userId', PrefsHelper.userId);
      PrefsHelper.setString('myEmail', PrefsHelper.myEmail);
      PrefsHelper.setString('myName', PrefsHelper.myName);
      PrefsHelper.setBool('isLogIn', PrefsHelper.isLogIn);

      Utils.toastMessage(response.message);
      Get.offAllNamed(AppRoute.home);
    } else if (response.statusCode == 406) {
      Get.toNamed(AppRoute.emailVerify,
          parameters: {'email': emailController.text});
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }
}
