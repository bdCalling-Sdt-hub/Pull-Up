import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/my_event_model.dart';

import '../../model/my_event_history_model.dart';
import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class MyEventController extends GetxController {
  Status status = Status.completed;
  bool isMoreLoading = false;

  List products = [];
  late TabController tabController;

  List eventHistory = [];

  int page = 1;

  MyEventModel? productModel;
  MyEventHistoryModel? myEventHistoryModel;
  ScrollController scrollController = ScrollController();

  Future<void> scrollControllerCall() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await eventsRepo();
      isMoreLoading = false;
      update();
    }
  }

  Future<void> eventsRepo() async {
    if (page == 1) {
      products.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrl.myEvent}?page=$page",
    );

    if (response.statusCode == 200) {
      productModel = MyEventModel.fromJson(jsonDecode(response.body));

      if (productModel?.data?.result != null) {
        products.addAll(productModel!.data!.result!);
        print("================> ${products.length}");
      }
      status = Status.completed;
      update();
      page += 1;
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  Future<void> myEventHistoryRepo() async {
    products.clear();
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
      AppUrl.myEventHistory,
    );

    if (response.statusCode == 200) {
      myEventHistoryModel =
          MyEventHistoryModel.fromJson(jsonDecode(response.body));

      if (myEventHistoryModel?.data != null) {
        eventHistory.clear();
        eventHistory.addAll(myEventHistoryModel!.data!);
        print("================> ${products.length}");
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
