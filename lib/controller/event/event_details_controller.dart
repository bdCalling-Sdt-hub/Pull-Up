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
      print(formattedDate); // Output: 31 May, 2024
      return formattedDate;
    } else {
      DateTime dateTime = DateTime.now();
      String formattedDate = DateFormat('dd MMMM, yyyy').format(dateTime);
      print(formattedDate);
      return formattedDate;
    }
  }

  getDayName(String dateString) {
    DateTime? dateTime = DateTime.tryParse(dateString);
    if (dateTime != null) {
      String dayName = DateFormat('EEEE').format(dateTime);
      print(dayName); // Output: Wednesday
      return dayName;
    } else {
      DateTime dateTime = DateTime.now();
      String dayName = DateFormat('EEEE').format(dateTime);
      print(dayName); // Output: Wednesday
      return dayName;
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

    print(response.statusCode);
    print(response.body);

    // isLoading = false;
    // update();
  }
}
