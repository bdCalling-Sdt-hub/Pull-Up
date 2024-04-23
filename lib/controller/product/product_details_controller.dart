import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/product_details_model.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class ProductDetailsController extends GetxController {
  Status status = Status.completed;
  ProductDetailsModel? productDetailsModel;
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
    } else {
      status = Status.error;
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
