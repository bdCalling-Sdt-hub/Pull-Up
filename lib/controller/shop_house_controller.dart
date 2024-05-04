import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_up/model/single_shop_model.dart';

import '../model/api_response_model.dart';
import '../services/api_service.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class ShopHouseController extends GetxController {
  Status status = Status.completed;

  SingleShopModel? singleShopModel;

  Future<void> shopHouseRepo(String userId) async {
    status = Status.loading;
    update();
    var response = await ApiService.getApi(
      "${AppUrl.product}/$userId",
    );

    if (response.statusCode == 200) {
      singleShopModel = SingleShopModel.fromJson(jsonDecode(response.body));

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
