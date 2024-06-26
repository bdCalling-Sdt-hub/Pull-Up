import 'package:get/get.dart';
import 'package:pull_up/controller/auth/create_account_controller.dart';
import 'package:pull_up/controller/auth/login_controller.dart';
import 'package:pull_up/controller/event/event_details_controller.dart';
import 'package:pull_up/controller/home_controller.dart';
import 'package:pull_up/controller/income_controller.dart';
import 'package:pull_up/controller/notification_controller.dart';
import 'package:pull_up/controller/payment_controller.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';
import 'package:pull_up/controller/upgrade_account/upgrade_account.dart';

import '../controller/add_deal_controller.dart';
import '../controller/deactive_account_controller.dart';
import '../controller/event/event_list_controller.dart';
import '../controller/history_controller.dart';
import '../controller/location/change_location.dart';
import '../controller/product/add_product_controller.dart';
import '../controller/auth/forgot_password_controller.dart';
import '../controller/event/new_event_controller.dart';
import '../controller/product/my_product_controller.dart';
import '../controller/product/product_details_controller.dart';
import '../controller/product/product_list_controller.dart';
import '../controller/shop_house_controller.dart';
import '../view/widget/google_map/google_map.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => UpgradeAccountController(), fenix: true);
    Get.lazyPut(() => AddProductController(), fenix: true);
    Get.lazyPut(() => NewEventController(), fenix: true);
    Get.lazyPut(() => AddDealController(), fenix: true);
    Get.lazyPut(() => CreateAccountController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => ForgotPasswordController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProductListController(), fenix: true);
    Get.lazyPut(() => ProductDetailsController(), fenix: true);
    Get.lazyPut(() => EventListController(), fenix: true);
    Get.lazyPut(() => EventDetailsController(), fenix: true);
    Get.lazyPut(() => MyProductController(), fenix: true);
    Get.lazyPut(() => IncomeController(), fenix: true);
    Get.lazyPut(() => PaymentController(), fenix: true);
    Get.lazyPut(() => ChangeLocationController(), fenix: true);
    Get.lazyPut(() => ShopHouseController(), fenix: true);
    Get.lazyPut(() => HistoryController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => DeActiveAccountController(), fenix: true);
    Get.lazyPut(() => ShowGoogleMapController(), fenix: true);
  }
}
