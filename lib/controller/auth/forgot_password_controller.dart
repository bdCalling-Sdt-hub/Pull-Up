import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/app_route.dart';
import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class ForgotPasswordController extends GetxController {
  bool isLoading = false;
  bool isLoadingVerify = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  Future<void> forgotPasswordController() async {
    isLoading = true;
    update();

    Map<String, String> body = {
      "email": emailController.text,
    };

    var response = await ApiService.postApi(
      AppUrl.forgotPassword,
      body,
    );

    print("===========${response.statusCode}===========");

    if (response.statusCode == 200) {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
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
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoadingVerify = false;
    update();
  }
}
