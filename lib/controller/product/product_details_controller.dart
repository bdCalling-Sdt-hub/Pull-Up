import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/product_details_model.dart';

import '../../model/shop_product_model.dart';
import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class ProductDetailsController extends GetxController {
  Status status = Status.completed;
  Status productStatus = Status.completed;
  ProductDetailsModel? productDetailsModel;
  ShopProductModel? shopProductModel;

  List products = [];

  int item = 1;

  num price = 0;

  increment() {
    item += 1;
    var numPrice = num.tryParse(productDetailsModel!.data!.price!);

    if (numPrice != null) {
      price = numPrice * item;
      update();
    }
  }

  decrement() {
    if (item != 1) {
      item -= 1;
      var numPrice = num.tryParse(productDetailsModel!.data!.price!);

      if (numPrice != null) {
        price = numPrice * item;
        update();
      }
    }
  }

  Future<void> productRepo({required String productId}) async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
      "${AppUrl.product}/single/$productId",
    );

    if (response.statusCode == 200) {
      productDetailsModel =
          ProductDetailsModel.fromJson(jsonDecode(response.body));

      status = Status.completed;
      update();
      price = num.tryParse(productDetailsModel?.data?.price ?? "0") ?? 0;
      productsRepo(productDetailsModel?.data?.userId ?? "");
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
      shopProductModel = ShopProductModel.fromJson(jsonDecode(response.body));

      if (shopProductModel?.data != null) {
        products.clear();
        products.addAll(shopProductModel!.data!);
      }

      productStatus = Status.completed;
      update();
    } else {
      productStatus = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  Future<void> paymentRepo(var paymentIntentData) async {
    // isLoading = true;
    // update();

    var body = {
      "productId": productDetailsModel!.data!.sId,
      "data": jsonEncode(paymentIntentData)
    };

    var response = await ApiService.postApi(AppUrl.paymentWithProduct, body);

    if (response.statusCode == 200) {
      Utils.toastMessage(message: response.message);
    } else {
      Utils.toastMessage(message: response.message);
    }

    print(response.statusCode);
    print(response.body);

    // isLoading = false;
    // update();
  }
}
