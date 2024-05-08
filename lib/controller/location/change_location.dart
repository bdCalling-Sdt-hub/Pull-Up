import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/app_route.dart';
import '../../services/location_service.dart';

class ChangeLocationController extends GetxController {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  bool isLoadingButton = false;
  double latitude = 1;

  double longitude = 1;

  latLongToAddress(LatLng value) async {
    List address = await LocationService.coordinateToAddress(
        lat: value.latitude, long: value.longitude);

    if (address.isNotEmpty) {
      searchController.text =
          "${address.first.street}, ${address.first.subLocality} ${address.first.locality}";
      update();
    }
  }

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
