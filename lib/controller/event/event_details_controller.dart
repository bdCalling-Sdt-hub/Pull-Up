import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/event_details_model.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class EventDetailsController extends GetxController {
  Status status = Status.completed;

  EventDetailsModel? eventDetailsModel;

  Future<void> eventDetailsRepo(String eventId) async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
      "${AppUrl.event}/$eventId",
    );

    if (response.statusCode == 200) {
      eventDetailsModel = EventDetailsModel.fromJson(jsonDecode(response.body));

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
