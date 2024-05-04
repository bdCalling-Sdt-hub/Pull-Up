import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../core/app_route.dart';
import '../../services/location_service.dart';

class ChangeLocationController extends GetxController {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  bool isLoadingButton = false;

  currentLocation() async {
    isLoading = true;
    update();
    Position? position = await LocationService.getCurrentPosition();
    if (position != null) {
      Get.toNamed(AppRoute.locatedShop, parameters: {
        "latitude": position.latitude.toString(),
        "longitude": position.longitude.toString(),
      });
    }

    isLoading = false;
    update();
  }

  pingLocation() async {
    isLoadingButton = true;
    update();

    List locations =
        await LocationService.addressToCoordinate(searchController.text);
    if (locations.isNotEmpty) {
      Get.toNamed(AppRoute.locatedShop, parameters: {
        "latitude": locations.first.latitude.toString(),
        "longitude": locations.first.longitude.toString(),
      });

      isLoadingButton = false;
      update();
    }
  }




}
