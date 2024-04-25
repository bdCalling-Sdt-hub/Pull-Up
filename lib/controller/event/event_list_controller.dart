import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/event_model.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class EventListController extends GetxController {
  Status status = Status.completed;

  List events = [];
  EventModel? eventModel;

  int page = 1;

  Future<void> eventsRepo() async {
    if (page == 1) {
      events.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrl.event}?page=$page",
    );

    if (response.statusCode == 200) {
      eventModel = EventModel.fromJson(jsonDecode(response.body));

      if (eventModel?.data?.result != null) {
        events.addAll(eventModel!.data!.result!);
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
