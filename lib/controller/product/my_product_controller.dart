import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';

import '../../model/product_history_model.dart';
import '../../model/product_model.dart';
import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class MyProductController extends GetxController {
  Status status = Status.completed;
  bool isMoreLoading = false;

  List myProducts = [];
  List productHistory = [];
  late TabController tabController;

  int page = 1;

  ProductModel? productModel;
  ProductHistoryModel? productHistoryModel;
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
      myProducts.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrl.myProduct}?page=$page",
    );

    if (response.statusCode == 200) {
      productModel = ProductModel.fromJson(jsonDecode(response.body));

      if (productModel?.data?.result != null) {
        myProducts.addAll(productModel!.data!.result!);
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
    productHistory.clear();
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
      AppUrl.myProductHistory,
    );

    if (response.statusCode == 200) {
      productHistoryModel =
          ProductHistoryModel.fromJson(jsonDecode(response.body));

      if (productHistoryModel?.data != null) {
        productHistory.addAll(productHistoryModel!.data!);
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
