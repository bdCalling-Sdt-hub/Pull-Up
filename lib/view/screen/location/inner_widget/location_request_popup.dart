import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_up/services/location_service.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_string.dart';

class RequestLocation {
  static getLocation() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppString.requestLocationPermission),
          actions: [
            TextButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColors.deepOrange),
                ),
                onPressed: () async {
                  await LocationService.locationPermission();
                  Get.back();
                },
                child: const Text(
                  AppString.yes,
                  style: TextStyle(color: AppColors.white50),
                )),
            TextButton(
                style: const ButtonStyle(
                  side: MaterialStatePropertyAll(
                    BorderSide(color: AppColors.grey900),
                  ),
                  // backgroundColor: MaterialStatePropertyAll(AppColors.blue_500),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  AppString.no,
                  style: TextStyle(color: AppColors.grey900),
                )),
          ],
        );
      },
    );
  }
}
