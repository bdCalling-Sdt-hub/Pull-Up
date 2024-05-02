import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_up/core/app_route.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class NewEventController extends GetxController {
  String? image;

  bool isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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

  selectImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (getImages != null) {
      image = getImages.path;
      update();
    }
  }

  Future<void> createEventRepo() async {
    isLoading = true;
    update();
    var body = {
      "name": nameController.text,
      "description": desController.text,
      "price": priceController.text,
      "location": addressController.text,
    };

    var response = await ApiService.multipartRequest(
        url: AppUrl.crateEvent, body: body, imagePath: image);

    if (response.statusCode == 200) {
      print(response.body);
      Get.toNamed(AppRoute.eventList);
    } else {
      Utils.toastMessage(message: response.message);
    }

    isLoading = false;
    update();
  }
}
