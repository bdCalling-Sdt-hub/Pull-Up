import 'package:get/get.dart';
import 'package:pull_up/controller/profile_controller/profile_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
