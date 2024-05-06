import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/profile_model.dart';
import 'package:pull_up/utils/app_string.dart';

import '../../services/api_service.dart';
import '../../services/location_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class NewEventController extends GetxController {
  String? image;

  Status status = Status.completed;

  bool isLoading = false;
  bool isLoadingLocation = false;
  ProfileModel? profileModel;

  TextEditingController nameController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  DateTime? selectedDate;

  TimeOfDay? selectedTime;

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

  currentLocation() async {
    isLoadingLocation = true;
    update();
    Position? position = await LocationService.getCurrentPosition();
    if (position != null) {
      List list = await LocationService.coordinateToAddress(
          lat: position.latitude, long: position.longitude);
      if (list.isNotEmpty) {
        addressController.text = list.first.administrativeArea;
      }
    }

    isLoadingLocation = false;
    update();
  }

  Future<void> selectDatePicker() async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      selectedDate = picked;
      dateController.text = selectedDate!.toIso8601String().split("T")[0];
      update();
    }
  }

  Future<void> selectTimePicker() async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      selectedTime = picked;
      timeController.text = "${selectedTime!.hour}:${selectedTime!.minute}";

      update();
      print(selectedTime);
      print(selectedTime.toString());
    }
  }

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

    String dateTime = "";

    if (selectedDate != null && selectedTime != null) {
      dateTime =
          "${selectedDate!.toIso8601String().split("T")[0]}T${selectedTime!.hour}:${selectedTime!.minute}:00.000";
    } else {
      Utils.toastMessage(message: AppString.pleaseSelectDataAndTime);
      return;
    }
    var body = {
      "name": nameController.text,
      "description": desController.text,
      "price": priceController.text,
      "location": addressController.text,
      "dateTime": dateTime
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
