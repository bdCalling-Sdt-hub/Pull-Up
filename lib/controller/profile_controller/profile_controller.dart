import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/model/profile_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../model/api_response_model.dart';
import '../../services/api_service.dart';
import '../../services/location_service.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_url.dart';
import '../../utils/app_utils.dart';

class ProfileController extends GetxController {
  Status status = Status.completed;

  String? image;
  String? identifyFont;
  String? identifyBack;
  String stripeUrl = '';

  TimeOfDay? startTime;
  bool isLoading = false;
  bool isLoadingLocation = false;
  WebViewController webViewController = WebViewController();

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBrithController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController businessHoursController = TextEditingController();

  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController routingNumberController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController organisationLocationController =
      TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController line1Controller = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  ProfileModel? profileModel;

  static ProfileController get instance => Get.put(ProfileController());

  font() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (getImages != null) {
      identifyFont = getImages.path;
      update();
    }
  }

  back() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (getImages != null) {
      identifyBack = getImages.path;
      update();
    }
  }

  Future<void> profileRepo() async {
    if (profileModel != null) return;
    status = Status.loading;
    update();

    var response = await ApiService.getApi(
      AppUrl.profile,
    );

    if (response.statusCode == 200) {
      profileModel = ProfileModel.fromJson(jsonDecode(response.body));

      status = Status.completed;
      update();

      nameController.text = profileModel?.data?.name ?? "";
      numberController.text = profileModel?.data?.phoneNumber ?? "";
      emailController.text = profileModel?.data?.email ?? "";
      stateController.text = profileModel?.data?.location ?? "";
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
        countryController.text = list.first.isoCountryCode;
        stateController.text = list.first.administrativeArea;
        cityController.text = list.first.locality;
        line1Controller.text = list.first.street;
        postalCodeController.text = list.first.postalCode;

        update();
      }
    }

    isLoadingLocation = false;
    update();
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

    update();
  }

  Future<void> updateProfile() async {
    isLoading = true;
    update();
    var body = {
      "name": nameController.text,
      "phoneNumber": numberController.text,
      "location": stateController.text,
      "email": emailController.text
    };

    var files = [
      {'name': 'NIDF', 'file': identifyFont},
      {'name': 'NIDB', 'file': identifyBack}
    ];

    var response = await ApiService.multipartRequestMultiFile(
        url: AppUrl.user, body: body, files: files, method: "patch");

    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoute.profile);
    } else {
      Utils.toastMessage(message: response.message);
    }

    isLoading = false;
    update();
  }

  Future<void> updateShoppingProfileRepo() async {
    isLoading = true;
    update();
    var body = {
      "name": nameController.text,
      "phoneNumber": numberController.text,
      "location": stateController.text
    };

    var files = [
      {'name': 'NIDF', 'file': identifyFont},
      {'name': 'NIDB', 'file': identifyBack}
    ];

    var response = await ApiService.multipartRequestMultiFile(
        url: AppUrl.updateAccount, body: body, files: files);

    if (response.statusCode == 200) {
      Get.offAllNamed(AppRoute.profile);
    } else {
      Utils.toastMessage(message: response.message);
    }

    isLoading = false;
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
      "dateOfBirth": dateOfBrithController.text,
      "businessLocation": jsonEncode({
        "city": cityController.text,
        "country": countryController.text,
        "state": stateController.text,
        "line1": line1Controller.text,
        "postal_code": postalCodeController.text,
      }),
      "account_holder_name": accountHolderNameController.text,
      "account_holder_type": "individual",
      "routing_number": routingNumberController.text,
      "account_number": accountNumberController.text,
    };

    var files = [
      {'name': 'NIDF', 'file': identifyFont},
      {'name': 'NIDB', 'file': identifyBack}
    ];

    var response = await ApiService.multipartRequestMultiFile(
        url: AppUrl.updateAccount, body: body, files: files);

    if (response.statusCode == 200) {
      stripeUrl = jsonDecode(response.body)['data']['url'] ?? "";
      print(stripeUrl);
      Get.toNamed(AppRoute.webview);
    } else {
      Utils.toastMessage(message: response.message);
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
      "organisationLocation": jsonEncode({
        "city": cityController.text,
        "country": countryController.text,
        "state": stateController.text,
        "line1": line1Controller.text,
        "postal_code": postalCodeController.text,
      }),
      "account_holder_name": accountHolderNameController.text,
      "account_holder_type": "individual",
      "routing_number": routingNumberController.text,
      "account_number": accountNumberController.text,
    };

    var files = [
      {'name': 'NIDF', 'file': identifyFont},
      {'name': 'NIDB', 'file': identifyBack}
    ];

    var response = await ApiService.multipartRequestMultiFile(
        url: AppUrl.updateAccount, body: body, files: files);

    if (response.statusCode == 200) {
      stripeUrl = jsonDecode(response.body)['data']['url'] ?? "";
      Get.offAllNamed(AppRoute.webview);
    } else {
      Utils.toastMessage(message: response.message);
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

  createStripeAccount() {
    print("stripeUrl =================> $stripeUrl");
    if (stripeUrl.isEmpty) return;
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains(AppUrl.baseUrl)) {
              Get.back();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(stripeUrl));
    webViewController.setOnConsoleMessage((message) {
      if (kDebugMode) {
        print("message: =========>> ${message.message}");
      }
    });
  }
}
