import 'package:get/get.dart';
import 'package:pull_up/view/screen/auth/create_account/create_account.dart';
import 'package:pull_up/view/screen/event/my_event/my_event.dart';
import 'package:pull_up/view/screen/history/history.dart';
import 'package:pull_up/view/screen/location/enable_location.dart';
import 'package:pull_up/view/screen/auth/forget_password/check_email.dart';
import 'package:pull_up/view/screen/auth/forget_password/forget_password_reset_password.dart';
import 'package:pull_up/view/screen/auth/forget_password/forget_password_verify.dart';
import 'package:pull_up/view/screen/auth/logIn/login.dart';
import 'package:pull_up/view/screen/event/event_list/event_list.dart';
import 'package:pull_up/view/screen/favorites/favorites.dart';
import 'package:pull_up/view/screen/home/home_screen.dart';
import 'package:pull_up/view/screen/location/change_location.dart';
import 'package:pull_up/view/screen/location/near_by_located_shop.dart';
import 'package:pull_up/view/screen/onboarding/onboarding.dart';
import 'package:pull_up/view/screen/payment/payment_screen.dart';
import 'package:pull_up/view/screen/payment/ticket_purchase_payment/ticket_purchase_payment.dart';
import 'package:pull_up/view/screen/product/add_product/add_product.dart';
import 'package:pull_up/view/screen/product/deal/add_deal.dart';
import 'package:pull_up/view/screen/product/my_product.dart';
import 'package:pull_up/view/screen/product/product_list/product_list.dart';
import 'package:pull_up/view/screen/profile/edit_profile/edit_profile.dart';
import 'package:pull_up/view/screen/profile/update_profile/update_profile.dart';
import 'package:pull_up/view/screen/profile/profile_screen/profile_screen.dart';
import 'package:pull_up/view/screen/profile/profile_without_login/profile_without_login.dart';
import 'package:pull_up/view/screen/profile/upgrade_account/upgrade_account.dart';
import 'package:pull_up/view/screen/setting/deactivate_account/deactiveate_account.dart';
import 'package:pull_up/view/screen/setting/setting_screen/setting_screen.dart';
import 'package:pull_up/view/screen/shop_house/shop_house.dart';
import 'package:pull_up/view/widget/no_internet.dart';

import '../view/screen/auth/create_account/email_verify.dart';
import '../view/screen/event/event_details/event_details.dart';
import '../view/screen/event/new_event/new_event.dart';
import '../view/screen/income/income.dart';
import '../view/screen/notification/notification.dart';
import '../view/screen/payment/product_payment/product_payment.dart';
import '../view/screen/product/product_details/product_details.dart';
import '../view/screen/profile/upgrade_account/inner_widget/select_location_from_mao.dart';
import '../view/screen/splash/splash.dart';
import '../view/screen/test.dart';

class AppRoute {
  static const String test = "/test.dart";
  static const String splash = "/splash.dart";
  static const String enableLocation = "/enable_location.dart";
  static const String onboarding = "/onboarding.dart";
  static const String createAccount = "/create_account.dart";
  static const String emailVerify = "/email_verify.dart";
  static const String login = "/login.dart";
  static const String forgetPasswordCheckEmail = "/check_email.dart";
  static const String forgetPasswordEmailVerify =
      "/forget_password_verify.dart";
  static const String forgetPasswordResetPassword =
      "/forget_password_reset_password.dart";
  static const String home = "/home_screen.dart";
  static const String changeLocation = "/change_location.dart";
  static const String locatedShop = "/near_by_located_shop.dart";
  static const String shopHouse = "/shop_house.dart";
  static const String productDetails = "/product_details.dart";
  static const String productPayment = "/product_payment.dart";
  static const String eventList = "/event_list.dart";
  static const String eventDetails = "/event_details.dart";
  static const String ticketPayment = "/ticket_purchase_payment.dart";
  static const String notification = "/notification.dart";
  static const String favorites = "/favorites.dart";
  static const String settingScreen = "/setting_screen.dart";
  static const String deactiveateAccount = "/deactiveate_account.dart";
  static const String newEvent = "/new_event.dart";
  static const String addProduct = "/add_product.dart";
  static const String productList = "/product_list.dart";
  static const String addDeal = "/add_deal.dart";
  static const String profileWithoutLogin = "/profile_without_login.dart";
  static const String profile = "/profile_screen.dart";
  static const String upgradeAccount = "/upgrade_account.dart";
  static const String income = "/income.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String noInternet = "/no_internet.dart";
  static const String myProduct = "/my_product.dart";
  static const String payment = "/payment_screen.dart";
  static const String history = "/history.dart";
  static const String myEvent = "/my_event.dart";
  static const String updateProfile = "/update_profile.dart";
  static const String selectLocationFromMap = "/select_location_from_mao.dart";

  static List<GetPage> routes = [
    GetPage(name: test, page: () => Test()),
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: enableLocation, page: () => EnableLocationScreen()),
    GetPage(name: onboarding, page: () => OnboardingScreen()),
    GetPage(name: createAccount, page: () => CreateAccountScreen()),
    GetPage(name: emailVerify, page: () => EmailVerify()),
    GetPage(name: login, page: () => LogInScreen()),
    GetPage(
        name: forgetPasswordCheckEmail, page: () => ForgetPasswordCheckEmail()),
    GetPage(
        name: forgetPasswordEmailVerify,
        page: () => ForgetPasswordEmailVerify()),
    GetPage(
        name: forgetPasswordResetPassword,
        page: () => ForgetPasswordResetPassword()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: changeLocation, page: () => ChangeLocationScreen()),
    GetPage(name: locatedShop, page: () => NearByLocatedShop()),
    GetPage(name: shopHouse, page: () => ShopHouseScreen()),
    GetPage(name: productDetails, page: () => ProductDetails()),
    GetPage(name: productPayment, page: () => Productpayment()),
    GetPage(name: eventList, page: () => EventListScreen()),
    GetPage(name: eventDetails, page: () => EventDetailsScreen()),
    GetPage(name: ticketPayment, page: () => TicketPurchasePayment()),
    GetPage(name: notification, page: () => NotificationScreen()),
    GetPage(name: favorites, page: () => FavoritesScreen()),
    GetPage(name: settingScreen, page: () => SettingScreen()),
    GetPage(name: deactiveateAccount, page: () => DeactiveateAccount()),
    GetPage(name: newEvent, page: () => NewEvent()),
    GetPage(name: addProduct, page: () => AddProduct()),
    GetPage(name: productList, page: () => ProductList()),
    GetPage(name: addDeal, page: () => AddDeal()),
    GetPage(name: profileWithoutLogin, page: () => ProfileWithOutLogIn()),
    GetPage(name: profile, page: () => ProfileScreen()),
    GetPage(name: upgradeAccount, page: () => UpgradeAccount()),
    GetPage(name: income, page: () => Income()),
    GetPage(name: editProfile, page: () => EditProfile()),
    GetPage(name: noInternet, page: () => NoInternet()),
    GetPage(name: myProduct, page: () => MyProduct()),
    GetPage(name: payment, page: () => PaymentScreen()),
    GetPage(name: history, page: () => HistoryScreen()),
    GetPage(name: myEvent, page: () => MyEvent()),
    GetPage(name: updateProfile, page: () => UpdateProfile()),
    GetPage(name: selectLocationFromMap, page: () => SelectLocationFromMap()),
  ];
}
