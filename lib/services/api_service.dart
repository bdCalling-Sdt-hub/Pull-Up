import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_up/core/app_route.dart';
import 'package:pull_up/helper/prefs_helper.dart';

import '../model/api_response_model.dart';
import 'package:mime/mime.dart';

import 'package:http_parser/http_parser.dart';

class ApiService {
  static const int timeOut = 30;

  static bool unAuthorization = false;

  static Future<ApiResponseModel> postApi(String url, body,
      {Map<String, String>? header}) async {
    dynamic responseJson;

    Map<String, String> mainHeader = {
      'Authorization': "Bearer ${PrefsHelper.token}",
    };

    if (kDebugMode) {
      print("===============================================>url $url");
      print("===============================================>url $body");
      print(
          "===============================================>url ${header ?? mainHeader}");
    }
    try {
      final response = await http
          .post(Uri.parse(url), body: body, headers: header ?? mainHeader)
          .timeout(const Duration(seconds: timeOut));
      responseJson = await handleResponse(response, (value) async {
        if (value) {
          var data = await getApi(url, header: header ?? mainHeader);
          return data;
        }
      });
    } on SocketException {
      return ApiResponseModel(503, "No internet connection", '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request", '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request Time Out", "");
    }

    return responseJson;
  }

  ///<<<======================== Get Api ==============================>>>

  static Future<ApiResponseModel> getApi(String url,
      {Map<String, String>? header}) async {
    dynamic responseJson;

    Map<String, String> mainHeader = {
      'Authorization': "Bearer ${PrefsHelper.token}",
    };

    if (kDebugMode) {
      print("===============================================>url $url");
      print(
          "===============================================>url ${header ?? mainHeader}");
    }

    try {
      final response = await http
          .get(Uri.parse(url), headers: header ?? mainHeader)
          .timeout(const Duration(seconds: timeOut));

      responseJson = await handleResponse(response, (value) async {
        var data = await getApi(url, header: header ?? mainHeader);
        return data;
      });
    } on SocketException {
      // Utils.toastMessage("please, check your internet connection");
      // Get.toNamed(AppRoutes.noInternet);

      return ApiResponseModel(503, "No internet connection", '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request", '');
    } on TimeoutException {
      // Utils.toastMessage("please, check your internet connection");

      // Get.toNamed(AppRoutes.noInternet);

      return ApiResponseModel(408, "Request Time Out", "");
    }

    return responseJson;
  }

  ///<<<======================== Put Api ==============================>>>

  static Future<ApiResponseModel> putApi(String url, Map<String, String> body,
      {Map<String, String>? header}) async {
    dynamic responseJson;

    Map<String, String> mainHeader = {
      'Authorization': "Bearer ${PrefsHelper.token}",
    };

    if (kDebugMode) {
      print("===============================================>url $url");
      print("===============================================>url $body");
      print(
          "===============================================>url ${header ?? mainHeader}");
    }

    try {
      final response = await http
          .put(Uri.parse(url), body: body, headers: header ?? mainHeader)
          .timeout(const Duration(seconds: timeOut));
      responseJson = await handleResponse(response, (value) async {
        if (value) {
          var data = await getApi(url, header: header ?? mainHeader);
          return data;
        }
      });
    } on SocketException {
      return ApiResponseModel(503, "No internet connection", '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request", '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request Time Out", "");
    }

    return responseJson;
  }

  static Future<ApiResponseModel> patchApi(String url,
      {Map<String, String>? body, Map<String, String>? header}) async {
    dynamic responseJson;

    Map<String, String> mainHeader = {
      'Authorization': "Bearer ${PrefsHelper.token}",
    };
    if (kDebugMode) {
      print("===============================================>url $url");
      print("===============================================>url $body");
      print(
          "===============================================>url ${header ?? mainHeader}");
    }
    try {
      if (body != null) {
        final response = await http
            .patch(Uri.parse(url), body: body, headers: header ?? mainHeader)
            .timeout(const Duration(seconds: timeOut));
        responseJson = await handleResponse(response, (value) async {
          if (value) {
            var data = await getApi(url, header: header ?? mainHeader);
            return data;
          }
        });
      } else {
        final response = await http
            .patch(Uri.parse(url), headers: header ?? mainHeader)
            .timeout(const Duration(seconds: timeOut));
        responseJson = await handleResponse(response, (value) async {
          if (value) {
            var data = await getApi(url, header: header ?? mainHeader);
            return data;
          }
        });
      }
    } on SocketException {
      return ApiResponseModel(503, "No internet connection", '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request", '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request Time Out", "");
    }

    return responseJson;
  }

  static Future<ApiResponseModel> deleteApi(String url,
      {Map<String, String>? body, Map<String, String>? header}) async {
    dynamic responseJson;

    Map<String, String> mainHeader = {
      'Authorization': "Bearer ${PrefsHelper.token}",
    };

    if (kDebugMode) {
      print("===============================================>url $url");
      print("===============================================>url $body");
      print(
          "===============================================>url ${header ?? mainHeader}");
    }

    try {
      if (body != null) {
        final response = await http
            .delete(Uri.parse(url), body: body, headers: header ?? mainHeader)
            .timeout(const Duration(seconds: timeOut));
        responseJson = await handleResponse(response, (value) async {
          if (value) {
            var data = await getApi(url, header: header ?? mainHeader);
            return data;
          }
        });
      } else {
        final response = await http
            .delete(Uri.parse(url), headers: header ?? mainHeader)
            .timeout(const Duration(seconds: timeOut));
        responseJson = await handleResponse(response, (value) async {
          if (value) {
            var data = await getApi(url, header: header);
            return data;
          }
        });
      }
    } on SocketException {
      return ApiResponseModel(503, "No internet connection", '');
    } on FormatException {
      return ApiResponseModel(400, "Bad response request", '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request time out", "");
    }
    return responseJson;
  }

  static dynamic handleResponse(http.Response response, callback) async {
    if (kDebugMode) {
      print(
          "===============================================>statusCode ${response.statusCode}");
      print(
          "===============================================>body ${response.body}");
    }

    switch (response.statusCode) {
      case 200:
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);
      case 201:
        return ApiResponseModel(
            200, jsonDecode(response.body)['message'], response.body);
      case 401:
        // if (!unAuthorization) {
        //   var token = await getRefreshToken();
        //
        //   if (token.isNotEmpty) {
        //     PrefsHelper.token = token;
        //     PrefsHelper.setString('token', PrefsHelper.token);
        //   } else {
        //     return ApiResponseModel(response.statusCode,
        //         jsonDecode(response.body)['message'], response.body);
        //   }
        //
        //   return await callback(true);
        // } else {
        //   return ApiResponseModel(response.statusCode,
        //       jsonDecode(response.body)['message'], response.body);
        // }
        Get.offAllNamed(AppRoute.login);
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);

      case 400:
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);
      case 404:
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);
      case 409:
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);
      default:
        return ApiResponseModel(response.statusCode,
            jsonDecode(response.body)['message'], response.body);
    }
  }

  static Future<ApiResponseModel> multipartRequest({
    required String url,
    method = "POST",
    String? imagePath,
    imageName = 'image',
    required Map<String, dynamic> body,
    Map<String, String>? header,
  }) async {
    try {
      Map<String, String> mainHeader = {
        'Authorization': "Bearer ${PrefsHelper.token}",
      };

      if (kDebugMode) {
        print("===============================================>url $url");
        print("===============================================>body $body");
        print(
            "===============================================>header ${header ?? mainHeader}");
      }

      var request = http.MultipartRequest(method, Uri.parse(url));
      body.forEach((key, value) {
        request.fields[key] = value;
      });

      if (imagePath != null) {
        var mimeType = lookupMimeType(imagePath);
        var shopImage = await http.MultipartFile.fromPath(imageName, imagePath,
            contentType: MediaType.parse(mimeType!));
        request.files.add(shopImage);
      }

      Map<String, String> headers = header ?? mainHeader;

      headers.forEach((key, value) {
        request.headers[key] = value;
      });

      var response = await request.send();

      if (kDebugMode) {
        print(
            "===============================================>statusCode ${response.statusCode}");
      }

      if (response.statusCode == 200) {
        String data = await response.stream.bytesToString();

        return ApiResponseModel(200, jsonDecode(data)['message'], data);
      } else if (response.statusCode == 201) {
        String data = await response.stream.bytesToString();

        return ApiResponseModel(200, jsonDecode(data)['message'], data);
      } else {
        String data = await response.stream.bytesToString();
        return ApiResponseModel(
            response.statusCode, jsonDecode(data)['message'], data);
      }
    } on SocketException {
      // Get.toNamed(AppRoute.noInternet);
      return ApiResponseModel(503, "No internet connection", '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request", '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request Time Out", "");
    }
  }

  static Future<ApiResponseModel> multipartRequestMultiFile({
    required String url,
    method = "POST",
    required List files,
    required Map<String, dynamic> body,
    Map<String, String>? header,
  }) async {
    try {
      Map<String, String> mainHeader = {
        'Authorization': "Bearer ${PrefsHelper.token}",
      };

      if (kDebugMode) {
        print("===============================================>url $url");
        print("===============================================>body $body");
        print(
            "===============================================>header ${header ?? mainHeader}");
      }

      var request = http.MultipartRequest(method, Uri.parse(url));
      body.forEach((key, value) {
        request.fields[key] = value;
      });

      for (var item in files) {
        if (item['file'] != null) {
          var mimeType = lookupMimeType(item['file']);
          var shopImage = await http.MultipartFile.fromPath(
              item['name'], item['file'],
              contentType: MediaType.parse(mimeType!));
          request.files.add(shopImage);
        }
      }

      Map<String, String> headers = header ?? mainHeader;

      headers.forEach((key, value) {
        request.headers[key] = value;
      });

      var response = await request.send();

      if (kDebugMode) {
        print("===================>statusCode ${response.statusCode}");

      }

      if (response.statusCode == 200) {
        String data = await response.stream.bytesToString();

        if (kDebugMode) {
          print("===================>data $data");
        }
        return ApiResponseModel(200, jsonDecode(data)['message'], data);
      } else if (response.statusCode == 201) {
        String data = await response.stream.bytesToString();

        if (kDebugMode) {
          print("===================>data $data");
        }

        return ApiResponseModel(200, jsonDecode(data)['message'], data);
      } else {
        String data = await response.stream.bytesToString();
        return ApiResponseModel(
            response.statusCode, jsonDecode(data)['message'], data);
      }
    } on SocketException {
      // Get.toNamed(AppRoute.noInternet);
      return ApiResponseModel(503, "No internet connection", '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request", '');
    } on TimeoutException {
      return ApiResponseModel(408, "Request Time Out", "");
    }
  }

  static Future<String> getRefreshToken() async {
    Map<String, String> mainHeader = {
      'Refresh-token': "Refresh-token ${PrefsHelper.refreshToken}",
    };

    if (kDebugMode) {
      print(
          "===============================================>url ${PrefsHelper.refreshToken}");
    }
    try {
      final response = await http
          .get(Uri.parse(PrefsHelper.refreshToken), headers: mainHeader)
          .timeout(const Duration(seconds: timeOut));

      if (kDebugMode) {
        print(
            "================================> accessToken ${jsonDecode(response.body)['data']['accessToken']}");
      }

      return jsonDecode(response.body)['data']['accessToken'];
    } on SocketException {
      return "";
    } on FormatException {
      return "";
    } on TimeoutException {
      return "";
    }
  }
}
