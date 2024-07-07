import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_up/model/shop_product_model.dart';
import 'package:pull_up/model/single_shop_model.dart';

import '../helper/prefs_helper.dart';
import '../model/api_response_model.dart';
import '../services/api_service.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class ShopHouseController extends GetxController {
  Status status = Status.completed;
  Status productStatus = Status.completed;

  SingleShopModel? singleShopModel;
  ShopProductModel? productModel;
  List products = [];

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

  Future<void> productsRepo(String userId) async {
    productStatus = Status.loading;
    update();

    var response = await ApiService.getApi(
      "${AppUrl.shopProduct}/$userId",
    );

    if (response.statusCode == 200) {
      productModel = ShopProductModel.fromJson(jsonDecode(response.body));

      if (productModel?.data != null) {
        products.clear();
        products.addAll(productModel!.data!);
      }

      productStatus = Status.completed;
      update();
    } else {
      productStatus = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  Future<void> favoriteRepo(String productId) async {
    var body = {"id": productId};

    var response = await ApiService.postApi(AppUrl.isFavorite, body);

    if (response.statusCode == 200) {
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  isFavoriteRepo(int index) {
    if (PrefsHelper.token.isEmpty) return;

    if (products[index].isFavorite != null && products[index].isFavorite) {
      products[index].isFavorite = false;
      update();
    } else {
      products[index].isFavorite = true;
      update();
    }

    favoriteRepo(products[index].sId);
  }
}
