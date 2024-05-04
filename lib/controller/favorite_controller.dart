import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/favorite_model.dart';

import '../services/api_service.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class FavoriteController extends GetxController {
  Status status = Status.completed;
  bool isMoreLoading = false;

  int page = 1;
  List favorites = [];

  FavoriteModel? favoriteModel;
  ScrollController scrollController = ScrollController();

  Future<void> scrollControllerCall() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (favoriteModel?.data?.meta?.totalPage != null &&
          favoriteModel!.data!.meta!.totalPage! < page) return;
      isMoreLoading = true;
      update();
      await favoriteRepo();
      isMoreLoading = false;
      update();
    }
  }

  removeFavorite(int index) {
    isFavoriteRepo(favorites[index].productId.sId);
    favorites.removeAt(index);
    update();
  }

  Future<void> favoriteRepo() async {
    if (page == 1) {
      favorites.clear();
      status = Status.loading;
      update();
    }

    var response = await ApiService.getApi(
      "${AppUrl.favorite}?page=$page",
    );

    if (response.statusCode == 200) {
      favoriteModel = FavoriteModel.fromJson(jsonDecode(response.body));

      if (favoriteModel?.data?.result != null) {
        favorites.addAll(favoriteModel!.data!.result!);
        print("================> ${favorites.length}");
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

  Future<void> isFavoriteRepo(String productId) async {
    var body = {"id": productId};

    var response = await ApiService.postApi(AppUrl.isFavorite, body);

    if (response.statusCode == 200) {
    } else {
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }
}
