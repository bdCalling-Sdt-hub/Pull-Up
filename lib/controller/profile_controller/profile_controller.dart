import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/model/profile_model.dart';

import '../../model/api_response_model.dart';
import '../../services/api_service.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class ProfileController extends GetxController {
  Status status = Status.completed;

  String? image;
  TimeOfDay? startTime;
  bool isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBrithController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController businessHoursController = TextEditingController();

  ProfileModel? profileModel;

  Future<void> profileRepo() async {
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
      AppUrl.profile,
    );

    if (response.statusCode == 200) {
      profileModel = ProfileModel.fromJson(jsonDecode(response.body));

      status = Status.completed;
      update();
      Utils.toastMessage(response.message);

      nameController.text = profileModel?.data?.name ?? "";
      numberController.text = profileModel?.data?.phoneNumber ?? "";
      emailController.text = profileModel?.data?.email ?? "";
    } else {
      status = Status.error;
      update();

      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  Future selectImageGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (getImages != null) {
      image = getImages.path;
      update();
      print(image);
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

  Future<void> validationTimePicker() async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor,
            onPrimary: AppColors.white50,
            onSurface: AppColors.grey900,
          ),
        ),
        child: child!,
      ),
      context: Get.context!,
      initialDate: DateTime(1999),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      // First click, set the start date
      businessHoursController.text = picked.toIso8601String();
    }
    update();
  }

  Future<void> dateOfBrithTimePicker() async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryColor,
            onPrimary: AppColors.white50,
            onSurface: AppColors.grey900,
          ),
        ),
        child: child!,
      ),
      context: Get.context!,
      initialDate: DateTime(1999),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      // First click, set the start date
      dateOfBrithController.text =
          "${picked.day}/${picked.month}/${picked.year}";
    }
    update();
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

  Future<void> updateBusinessProfileRepo() async {
    isLoading = true;
    update();
    var body = {
      "businessName": nameController.text,
      "businessNumber": numberController.text,
      "businessEmail": emailController.text,
      "businessDescription": desController.text,
      "businessWebsite": websiteController.text,
      "businessHours": businessHoursController.text,
      "businessLocation": dateOfBrithController.text,
      "dateOfBirth": "21/09/1994"
    };

    var response = await ApiService.multipartRequest(
        url: AppUrl.updateAccount, body: body, imagePath: image);

    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoute.profile);
      print(response.body);
    } else {
      Utils.toastMessage(response.message);
    }

    isLoading = false;
    update();
  }

  Future<void> updateOrganisationProfileRepo() async {
    isLoading = true;
    update();
    var body = {
      "organisationName": nameController.text,
      "organisationNumber": numberController.text,
      "organisationEmail": emailController.text,
      "organisationDescription": desController.text,
      "organisationWebsite": websiteController.text,
      "dateOfBirth": dateOfBrithController.text,
    };

    var response = await ApiService.multipartRequest(
        url: AppUrl.updateAccount, body: body, imagePath: image);

    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoute.profile);
      print(response.body);
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
