import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/product_model.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class ProductListController extends GetxController {
  Status status = Status.completed;
  bool isMoreLoading = false;

  List products = [];

  int page = 1;

  ProductModel? productModel;
  ScrollController scrollController = ScrollController();

  Future<void> scrollControllerCall({required String keyword}) async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await productsRepo(keyword: keyword);
      isMoreLoading = false;
      update();
    }
  }

  Future<void> productsRepo({required String keyword}) async {
    if (page == 1) {
      products.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrl.product}?keywords=$keyword&page=$page",
    );

    if (response.statusCode == 200) {
      productModel = ProductModel.fromJson(jsonDecode(response.body));

      if (productModel?.data?.result != null) {
        products.addAll(productModel!.data!.result!);
        print("================> ${products.length}");
      }
      status = Status.completed;
      update();
      page += 1;
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
