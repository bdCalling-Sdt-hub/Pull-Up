import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/event_details_model.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';
import 'package:intl/intl.dart';

class EventDetailsController extends GetxController {
  Status status = Status.completed;

  EventDetailsModel? eventDetailsModel;

  formatDate(String dateString) {
    DateTime? dateTime = DateTime.tryParse(dateString);
    if (dateTime != null) {
      String formattedDate = DateFormat('dd MMMM, yyyy').format(dateTime);
      // Output: 31 May, 2024
      return formattedDate;
    } else {
      return "";
    }
  }

  getDayName(String dateString) {
    DateTime? dateTime = DateTime.tryParse(dateString);
    if (dateTime != null) {
      String dayName = DateFormat('EEEE').format(dateTime);
      // Output: Wednesday
      return dayName;
    } else {
      return "";
    }
  }

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

  Future<void> paymentRepo(var paymentIntentData) async {
    // isLoading = true;
    // update();

    var body = {
      "eventId": eventDetailsModel!.data!.sId,
      "data": jsonEncode(paymentIntentData)
    };

    var response = await ApiService.postApi(AppUrl.paymentWithEvent, body);

    if (response.statusCode == 200) {
      Utils.toastMessage(message: response.message);
    } else {
      Utils.toastMessage(message: response.message);
    }


    // isLoading = false;
    // update();
  }
}
