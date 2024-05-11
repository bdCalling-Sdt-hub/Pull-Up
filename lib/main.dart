import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:pull_up/helper/prefs_helper.dart';
import 'package:pull_up/services/location_service.dart';
import 'package:pull_up/services/notification_service.dart';
import 'package:pull_up/services/other_service.dart';
import 'package:pull_up/services/socket_service.dart';
import 'package:pull_up/theme/light_theme.dart';
import 'package:pull_up/utils/payment_key.dart';

import 'core/app_route.dart';
import 'core/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = PaymentKey.publishableKey;
  await PrefsHelper.getAllPrefData();
  await ScreenUtil.ensureScreenSize();
  DependencyInjection dI = DependencyInjection();
  dI.dependencies();
  NotificationService notificationService = NotificationService();
  notificationService.initLocalNotification();
  OtherService.checkConnection();
  SocketServices.connectToSocket();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          builder: (context, child) {
            return Overlay(
              initialEntries: [
                OverlayEntry(
                  builder: (context) => child ?? Container(),
                ),
              ],
            );
          },
          debugShowCheckedModeBanner: false,
          theme: themeData,
          transitionDuration: const Duration(milliseconds: 200),
          initialRoute: AppRoute.splash,
          getPages: AppRoute.routes,
        );
      },
    );
  }
}
