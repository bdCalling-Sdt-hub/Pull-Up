import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/near_by_shop_model.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class NearbyLocationShopController extends GetxController {
  Status status = Status.completed;

  NearByShopModel? nearByShopModel;
  List shops = [];

  Future<void> nearbyShopRepo(
      {required String latitude, required String longitude}) async {
    status = Status.loading;
    update();
    var response = await ApiService.getApi(
      "${AppUrl.nearbyShop}?longitude=$longitude&latitude=$latitude&accountType=business",
    );

    if (response.statusCode == 200) {
      nearByShopModel = NearByShopModel.fromJson(jsonDecode(response.body));

      if (nearByShopModel?.data != null) {
        shops.addAll(nearByShopModel!.data!);
      }

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
