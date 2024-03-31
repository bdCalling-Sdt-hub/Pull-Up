import 'package:get/get.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';
import 'package:pull_up/controller/upgrade_account/upgrade_account.dart';

import '../controller/add_deal_controller.dart';
import '../controller/add_product_controller.dart';
import '../controller/new_event_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => UpgradeAccountController(), fenix: true);
    Get.lazyPut(() => AddProductController(), fenix: true);
    Get.lazyPut(() => NewEventController(), fenix: true);
    Get.lazyPut(() => AddDealController(), fenix: true);
  }
}
