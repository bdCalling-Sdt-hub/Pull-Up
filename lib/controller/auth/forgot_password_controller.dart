import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/app_route.dart';
import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class ForgotPasswordController extends GetxController {
  bool isLoading = false;
  bool isLoadingVerify = false;
  bool isLoadingReset = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();



  Future<void> forgotEmailRepo() async {
    isLoading = true;
    update();

    Map<String, String> body = {
      "email": emailController.text,
    };

    var response = await ApiService.patchApi(
      AppUrl.forgotPassword,
      body: body,
    );

    print("===========${response.statusCode}===========");

    if (response.statusCode == 200) {
      Utils.toastMessage(response.message);
      Get.toNamed(AppRoute.forgetPasswordEmailVerify);
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

    var response = await ApiService.patchApi(
      AppUrl.forgotPasswordVerify,
      body: body,
    );

    print("===========${response.statusCode}===========");

    if (response.statusCode == 200) {
      Get.toNamed(AppRoute.forgetPasswordResetPassword);
      Utils.toastMessage(response.message);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoadingVerify = false;
    update();
  }

  Future<void> resetPasswordRepo() async {
    isLoadingReset = true;
    update();

    Map<String, String> body = {
      "email": emailController.text,
      "password": passwordController.text
    };

    var response = await ApiService.patchApi(
      AppUrl.resetPassword,
      body: body,
    );

    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoute.login);
      Utils.toastMessage(response.message);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoadingReset = false;
    update();
  }
}
