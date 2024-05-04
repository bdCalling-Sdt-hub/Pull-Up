import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';

import '../../model/product_model.dart';
import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class MyProductController extends GetxController {
  Status status = Status.completed;
  bool isMoreLoading = false;

  List products = [];
  late TabController tabController;

  int page = 1;

  ProductModel? productModel;
  ScrollController scrollController = ScrollController();

  Future<void> scrollControllerCall() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await productsRepo();
      isMoreLoading = false;
      update();
    }
  }

  Future<void> productsRepo() async {
    if (page == 1) {
      products.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrl.myProduct}?page=$page",
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

  Future<void> myProductsHistoryRepo() async {
    products.clear();
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
      AppUrl.myProductHistory,
    );

    if (response.statusCode == 200) {
      productModel = ProductModel.fromJson(jsonDecode(response.body));

      if (productModel?.data?.result != null) {
        products.addAll(productModel!.data!.result!);
        print("================> ${products.length}");
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
