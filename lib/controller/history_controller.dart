import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/product_history_model.dart';

import '../services/api_service.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class HistoryController extends GetxController {
  Status status = Status.completed;

  List history = [];

  ProductHistoryModel? productHistoryModel;

  Future<void> historyRepo() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
      AppUrl.history,
    );

    if (response.statusCode == 200) {
      productHistoryModel =
          ProductHistoryModel.fromJson(jsonDecode(response.body));

      if (productHistoryModel?.data != null) {
        history.addAll(productHistoryModel!.data!);
        print("================> ${history.length}");
      }
      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
