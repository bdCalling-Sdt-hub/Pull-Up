import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_up/helper/prefs_helper.dart';
import 'package:pull_up/model/api_response_model.dart';

import '../services/api_service.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class DeActiveAccountController extends GetxController {
  Status status = Status.completed;

  TextEditingController passwordController = TextEditingController();

  Future<void> deActiveAccountsRepo() async {
    status = Status.loading;
    update();

    var body = {"currentPassword": passwordController.text};

    var response = await ApiService.patchApi(AppUrl.deActiveUser, body: body);

    if (response.statusCode == 200) {
      await PrefsHelper.removeAllPrefData();
      SystemNavigator.pop();
      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
