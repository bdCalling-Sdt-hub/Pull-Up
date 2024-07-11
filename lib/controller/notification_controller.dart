import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/notification_model.dart';

import '../services/api_service.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class NotificationController extends GetxController {
  Status status = Status.completed;

  NotificationModel? notificationModel;

  List notifications = [];

  int page = 1;

  Future<void> notificationsRepo() async {
    if (page == 1) {
      notifications.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrl.notifications}?page=$page",
    );

    if (response.statusCode == 200) {
      notificationModel = NotificationModel.fromJson(jsonDecode(response.body));

      if (notificationModel?.data?.result != null) {
        notifications.addAll(notificationModel!.data!.result!);
      }
      page += 1;
      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  String getFormattedDate(String dateString) {
    // String dateString = "2024-02-01T04:39:03.524Z";
    DateTime? originalDateTime = DateTime.tryParse(dateString);

    originalDateTime ??= DateTime.now();
    DateTime currentDateTime = DateTime.now();

    Duration difference = currentDateTime.difference(originalDateTime);
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return ("${difference.inMinutes} minutes ago");
      } else if (difference.inMinutes == 0) {
        return ("just now");
      } else {
        return ("${difference.inHours} hours ago");
      }
      // return ("${difference.inHours % 24} ${"hours".tr} ${difference.inMinutes % 60} ${"minutes".tr}");
    } else {
      var createdAtTime = dateString.split(".")[0];
      var date = createdAtTime.split("T")[0];
      return date;
    }
  }
}
