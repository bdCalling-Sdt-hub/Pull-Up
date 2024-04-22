import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/keyword_model.dart';
import 'package:pull_up/model/product_model.dart';

import '../services/api_service.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class HomeController extends GetxController {
  // bool isLoading = false;
  Status bookStatus = Status.completed;
  Status burgerStatus = Status.completed;
  Status keywordStatus = Status.completed;
  bool isMoreLoading = false;
  ProductModel? productModel;
  KeywordModel? keywordModel;
  List books = [];
  List burgers = [];
  List keywords = [];
  int bookPage = 1;
  int burgerPage = 1;

  ScrollController bookScrollController = ScrollController();
  ScrollController burgerScrollController = ScrollController();

  Future<void> bookScrollControllerCall() async {
    if (bookScrollController.position.pixels ==
        bookScrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await bookRepo();
      isMoreLoading = false;
      update();
    }
  }

  Future<void> burgerScrollControllerCall() async {
    if (bookScrollController.position.pixels ==
        bookScrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await burgerRepo();
      isMoreLoading = false;
      update();
    }
  }

  Future<void> bookRepo() async {
    if (bookPage == 1) {
      books.clear();
      bookStatus = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrl.product}?keywords=Book&page=$bookPage",
    );

    if (response.statusCode == 200) {
      productModel = ProductModel.fromJson(jsonDecode(response.body));

      if (productModel?.data?.result != null) {
        books.addAll(productModel!.data!.result!);
        print("================> ${books.length}");
      }
      bookStatus = Status.completed;
      update();
    } else {
      bookStatus = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  Future<void> burgerRepo() async {
    if (burgerPage == 1) {
      burgers.clear();
      burgerStatus = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrl.product}?keywords=Burger&page=$burgerPage",
    );

    if (response.statusCode == 200) {
      productModel = ProductModel.fromJson(jsonDecode(response.body));

      if (productModel?.data?.result != null) {
        burgers.addAll(productModel!.data!.result!);
        print("================> ${burgers.length}");
      }
      burgerStatus = Status.completed;
      update();
    } else {
      burgerStatus = Status.error;
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  Future<void> keywordRepo() async {
    keywords.clear();
    keywordStatus = Status.loading;
    update();

    var response = await ApiService.getApi(
      AppUrl.keywords,
    );

    if (response.statusCode == 200) {
      keywordModel = KeywordModel.fromJson(jsonDecode(response.body));

      if (keywordModel?.data != null) {
        keywords.addAll(keywordModel!.data!);
        print("================> ${keywords.length}");
      }
      keywordStatus = Status.completed;
      update();
    } else {
      keywordStatus = Status.error;
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
