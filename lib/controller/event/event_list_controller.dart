import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/event_model.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class EventListController extends GetxController {
  Status status = Status.completed;

  bool isMoreLoading = false;

  List events = [];
  EventModel? eventModel;

  int page = 1;

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
      events.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrl.eventList}?page=$page",
    );

    if (response.statusCode == 200) {
      eventModel = EventModel.fromJson(jsonDecode(response.body));

      if (eventModel?.data != null) {
        events.addAll(eventModel!.data!);
        print("================> ${events.length}");
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
