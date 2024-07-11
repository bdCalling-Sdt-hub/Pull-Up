import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_up/helper/prefs_helper.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/event_list_model.dart';
import 'package:pull_up/model/keyword_model.dart';
import 'package:pull_up/model/product_model.dart';

import '../services/api_service.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class HomeController extends GetxController {
  bool isSearch = false;
  Status bookStatus = Status.completed;
  Status burgerStatus = Status.completed;
  Status eventStatus = Status.completed;
  Status keywordStatus = Status.completed;
  bool isMoreLoading = false;
  ProductModel? productModel;
  KeywordModel? keywordModel;
  EventListModel? eventListModel;
  List books = [];
  List burgers = [];
  List events = [];
  List keywords = [];
  int bookPage = 1;
  int bookTotalPage = 0;
  int burgerPage = 1;
  int eventPage = 1;

  TextEditingController searchController = TextEditingController();

  ScrollController bookScrollController = ScrollController();
  ScrollController burgerScrollController = ScrollController();
  ScrollController eventScrollController = ScrollController();

  changeSearchKeyword(value) {
    update();
  }

  void updateKeyboardVisibility() {
    final bool isKeyboardVisible = Get.mediaQuery.viewInsets.bottom > 0;

    isSearch = isKeyboardVisible;
    update();
  }

  Future<void> bookScrollControllerCall() async {
    if (bookScrollController.position.pixels ==
        bookScrollController.position.maxScrollExtent) {
      if (bookTotalPage < bookPage) return;
      isMoreLoading = true;
      update();
      await bookRepo();
      isMoreLoading = false;
      update();
    }
  }

  Future<void> eventScrollControllerCall() async {
    if (eventScrollController.position.pixels ==
        eventScrollController.position.maxScrollExtent) {
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
      "${AppUrl.product}?keywords=Book&page=$bookPage${PrefsHelper.userId.isNotEmpty ? "&userId=${PrefsHelper.userId}" : ''}",
    );

    if (response.statusCode == 200) {
      productModel = ProductModel.fromJson(jsonDecode(response.body));

      if (productModel?.data?.result != null) {
        books.addAll(productModel!.data!.result!);
      }
      if (productModel?.data?.meta?.totalPage != null) {
        bookTotalPage = productModel!.data!.meta!.totalPage!;
      }
      bookStatus = Status.completed;
      update();
      bookPage += 1;
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
      "${AppUrl.product}?keywords=Burger&page=$burgerPage${PrefsHelper.userId.isNotEmpty ? "&userId=${PrefsHelper.userId}" : ''}",
    );

    if (response.statusCode == 200) {
      productModel = ProductModel.fromJson(jsonDecode(response.body));

      if (productModel?.data?.result != null) {
        burgers.addAll(productModel!.data!.result!);
      }
      burgerStatus = Status.completed;
      update();
      burgerPage += 1;
    } else {
      burgerStatus = Status.error;
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  Future<void> eventRepo() async {
    if (eventPage == 1) {
      events.clear();
      eventStatus = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrl.event}?page=$eventPage",
    );

    if (response.statusCode == 200) {
      eventListModel = EventListModel.fromJson(jsonDecode(response.body));

      if (eventListModel?.data?.result != null) {
        events.addAll(eventListModel!.data!.result!);
      }
      eventStatus = Status.completed;
      update();
      eventPage += 1;
    } else {
      eventStatus = Status.error;
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
      }
      keywordStatus = Status.completed;
      update();
    } else {
      keywordStatus = Status.error;
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  Future<void> isFavoriteRepo(String productId) async {
    var body = {"id": productId};

    var response = await ApiService.postApi(AppUrl.isFavorite, body);

    if (response.statusCode == 200) {
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  bookIsFavoriteRepo(int index) {
    if (PrefsHelper.token.isEmpty) return;

    if (books[index].isFavorite != null && books[index].isFavorite) {
      books[index].isFavorite = false;
      update();
    } else {
      books[index].isFavorite = true;
      update();
    }

    isFavoriteRepo(books[index].sId);
  }

  burgerIsFavoriteRepo(int index) {
    if (PrefsHelper.token.isEmpty) return;

    if (burgers[index].isFavorite != null && burgers[index].isFavorite) {
      burgers[index].isFavorite = false;
      update();
    } else {
      burgers[index].isFavorite = true;
      update();
    }

    isFavoriteRepo(burgers[index].sId);
  }
}
