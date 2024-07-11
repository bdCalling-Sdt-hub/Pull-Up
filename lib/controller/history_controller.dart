import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/my_event_history_model.dart';
import 'package:pull_up/model/product_history_model.dart';

import '../services/api_service.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class HistoryController extends GetxController {
  Status status = Status.completed;

  List productHistory = [];
  List eventHistory = [];
  late TabController tabController;

  ProductHistoryModel? productHistoryModel;
  MyEventHistoryModel? myEventHistoryModel;

  Future<void> productHistoryRepo() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
      AppUrl.history,
    );

    if (response.statusCode == 200) {
      productHistoryModel =
          ProductHistoryModel.fromJson(jsonDecode(response.body));

      if (productHistoryModel?.data != null) {
        productHistory.clear();
        productHistory.addAll(productHistoryModel!.data!);
      }
      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  Future<void> eventHistoryRepo() async {
    eventHistory.clear();
    status = Status.loading;
    update();

    var response = await ApiService.getApi(AppUrl.eventHistory);

    if (response.statusCode == 200) {
      myEventHistoryModel =
          MyEventHistoryModel.fromJson(jsonDecode(response.body));

      if (myEventHistoryModel?.data != null) {
        eventHistory.clear();
        eventHistory.addAll(myEventHistoryModel!.data!);
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
