import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_up/utils/app_url.dart';

import '../../core/app_route.dart';
import '../../model/api_response_model.dart';
import '../../model/profile_model.dart';
import '../../services/api_service.dart';
import '../../utils/app_utils.dart';

class AddProductController extends GetxController {
  String? image;
  bool isLoading = false;
  TextEditingController tagController = TextEditingController();

  ProfileModel? profileModel;
  Status status = Status.completed;

  Future<void> profileRepo() async {
    if (profileModel != null) return;
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
      AppUrl.profile,
    );

    if (response.statusCode == 200) {
      profileModel = ProfileModel.fromJson(jsonDecode(response.body));

      print(profileModel?.data?.isExpiration);

      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  List tagList = [];

  Future selectImageGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (getImages != null) {
      image = getImages.path;
      update();
    }
  }

  //Pick Image from Camera

  removeKeyword(item) {
    tagList.remove(item);
    update();
  }

  selectImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (getImages != null) {
      image = getImages.path;
      update();
    }
  }

  TextEditingController productNameController = TextEditingController();

  TextEditingController desController = TextEditingController();

  TextEditingController priceController = TextEditingController();
  final switchController = ValueNotifier<bool>(false);

  Future<void> addProductRepo() async {
    isLoading = true;
    update();
    var body = {
      'name': productNameController.text,
      'description': desController.text,
      'price': priceController.text,
      'keywords': jsonEncode(tagList),
    };

    var response = await ApiService.multipartRequest(
        url: AppUrl.addProduct, body: body, imagePath: image);

    if (kDebugMode) {
      print("=====================================>response ${response.body}");
    }

    if (response.statusCode == 200) {
      Get.toNamed(AppRoute.myProduct);
    } else {
      Utils.toastMessage(message: response.message);
    }

    isLoading = false;
    update();
  }
}
