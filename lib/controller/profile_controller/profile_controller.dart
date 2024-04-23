import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/api_service.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class ProfileController extends GetxController {
  // Status status = Status.completed;

  String? image;
  TimeOfDay? startTime;
  bool isLoading = false;

  TextEditingController nameController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController desController = TextEditingController();

  TextEditingController websiteController = TextEditingController();

  TextEditingController businessHoursController = TextEditingController();

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

  timePicker() async {
    // First click - select start time
    final TimeOfDay? selectedStartTime = await showTimePicker(
      context: Get.context!,
      initialTime: startTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (selectedStartTime != null) {
      startTime = selectedStartTime;
      businessHoursController.text = "${_formatTimeOfDay(startTime!)} -";
      update();
    }

    print("===============Picked Time${businessHoursController.text}");
    update();
  }

  Future<void> updateProfileRepo() async {
    isLoading = true;
    update();
    var body = {
      "businessName": nameController.text,
      "businessNumber": numberController.text,
      "businessEmail": emailController.text,
      // "businessDescription":"Hello Hello",
      // "businessWebsite":"abc.com",
      // "businessHours":"8:00-20:00"
    };

    var response = await ApiService.multipartRequest(
        url: AppUrl.updateAccount, body: body, imagePath: image);

    if (response.statusCode == 200) {
      // Get.offAllNamed(AppRoute.signInScreen);
    } else {
      Utils.toastMessage(response.message);
    }

    isLoading = false;
    update();
  }

  String _formatTimeOfDay(TimeOfDay timeOfDay) {
    int hour = timeOfDay.hour;
    int minute = timeOfDay.minute;
    String period = (hour >= 12) ? 'PM' : 'AM';

    // Convert 24-hour format to 12-hour format
    hour = (hour > 12) ? (hour - 12) : hour;
    hour = (hour == 0) ? 12 : hour;

    String hourStr = (hour < 10) ? '0$hour' : '$hour';
    String minuteStr = (minute < 10) ? '0$minute' : '$minute';

    return '$hourStr:$minuteStr $period';
  }
}
