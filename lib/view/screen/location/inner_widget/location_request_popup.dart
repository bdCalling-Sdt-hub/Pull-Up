import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../services/location_service.dart';
import '../../../../utils/app_images.dart';

class RequestLocation {
  static getLocation() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.googleMap,
                height: 100,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                  'Pull Up App collects location data to enable identification of nearby products'),
            ],
          ),
          actions: [
            TextButton(
                style: const ButtonStyle(
                  side: WidgetStatePropertyAll(
                    BorderSide(color: AppColors.primaryColor),
                  ),
                  // backgroundColor: MaterialStatePropertyAll(AppColors.blue_500),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'No',
                  style: TextStyle(color: AppColors.black),
                )),
            TextButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                onPressed: () async {
                  await LocationService.locationPermission();
                  Get.back();
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        );
      },
    );
  }
}
