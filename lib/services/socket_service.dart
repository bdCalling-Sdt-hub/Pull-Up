import 'package:flutter/cupertino.dart';
import 'package:pull_up/utils/app_url.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../helper/prefs_helper.dart';
import 'notification_service.dart';

class SocketServices {
  static late io.Socket socket;
  bool show = false;

  static NotificationService notificationService = NotificationService();

  ///<<<============ Connect with socket ====================>>>
  static void connectToSocket() {
    socket = io.io(
        AppUrl.socketUrl,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());

    socket.onConnect((data) {
      debugPrint("=============================> Connection $data");
    });
    socket.onConnectError((data) {
      print("============================>Connection Error $data");
    });

    socket.connect();

    socket.on("user-notification::${PrefsHelper.userId}", (data) {
      print("================> get Data on socket: $data");
      notificationService.showNotification(data);
    });
  }
}
