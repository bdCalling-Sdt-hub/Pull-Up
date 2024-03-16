import 'package:get/get.dart';
import 'package:pull_up/view/screen/auth/create_account.dart';
import 'package:pull_up/view/screen/auth/enable_location.dart';
import 'package:pull_up/view/screen/onboarding.dart';

import '../view/screen/splash.dart';
import '../view/screen/test.dart';

class AppRoute {
  static const String test = "/test.dart";
  static const String splash = "/splash.dart";
  static const String enableLocation = "/enable_location.dart";
  static const String onboarding = "/onboarding.dart";
  static const String createAccount = "/create_account.dart";

  static List<GetPage> routes = [
    GetPage(name: test, page: () =>  Test()),
    GetPage(name: splash, page: () =>  SplashScreen()),
    GetPage(name: enableLocation, page: () =>  EnableLocationScreen()),
    GetPage(name: onboarding, page: () =>  OnboardingScreen()),
    GetPage(name: createAccount, page: () =>  CreateAccountScreen()),
  ];
}
