
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  static inti() async {
    bool isEnabled = await checkLocationEnabled();
    if (isEnabled) {
      locationPermission();
    }
  }

  static Future<bool> checkLocationEnabled() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (kDebugMode) {
      print(serviceEnabled);
    }
    return serviceEnabled;
  }

  static Future<bool> locationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (kDebugMode) {
      print(permission);
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (kDebugMode) {
        print(permission);
      }
      if (permission == LocationPermission.denied) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }

  static getCurrentPosition() async {
    try {
      var aa = await Geolocator.getLastKnownPosition();
      print(aa);
      List list = [];
      if (aa != null) {
        list = await coordinateToAddress(lat: aa.latitude, long: aa.longitude);
      }

      return list;
    } catch (e) {
      return [];
    }
  }

  static Future<List> addressToCoordinate(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);

      if (kDebugMode) {
        print(locations);
      }
      return locations;
    } catch (e) {
      return [];
    }
  }

  static Future<List> coordinateToAddress(
      {required double lat, required double long}) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(
        lat,
        long,
      );

      print(placeMarks);
      return placeMarks;
      // print(placeMarks.first.street);
      // print(placeMarks.first.subLocality);
      // print(placeMarks.first.locality);
      // print(placeMarks.first.postalCode);
    } catch (e) {
      return [];
    }
  }
}
