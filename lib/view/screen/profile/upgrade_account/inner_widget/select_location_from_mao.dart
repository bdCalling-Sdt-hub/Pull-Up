import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_up/view/widget/google_map/google_map.dart';

class SelectLocationFromMap extends StatelessWidget {
  const SelectLocationFromMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowGoogleMap(
        onTapLatLong: (value) {
          Get.back(result: value);
        },
      ),
    );
  }
}
