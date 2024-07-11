
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


    if (response.statusCode == 200) {
      Utils.toastMessage(message: response.message);
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

  Future<void> resendOtp() async {
    Map<String, String> body = {
      "email": emailController.text,
    };

    var response = await ApiService.patchApi(
      AppUrl.forgotPassword,
      body: body,
    );

    if (response.statusCode == 200) {
      Utils.toastMessage(message: response.message);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  Future<void> verifyEmailRepo() async {
    isLoadingVerify = true;
    update();

    Map<String, String> body = {
      "email": emailController.text,
      "oneTimeCode": otpController.text
    };


    var response = await ApiService.postApi(
      AppUrl.verifyEmail,
      body,
    );


    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoute.login);
      Utils.toastMessage(message: response.message);
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }

    isLoadingVerify = false;
    update();
  }
}
