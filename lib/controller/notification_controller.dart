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
      AppUrl.notifications,
    );

    if (response.statusCode == 200) {
      notificationModel = NotificationModel.fromJson(jsonDecode(response.body));

      if (notificationModel?.data?.result != null) {
        notifications.addAll(notificationModel!.data!.result!);
        print("================> ${notifications.length}");
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
}
