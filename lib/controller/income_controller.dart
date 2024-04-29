import 'dart:convert';

import 'package:get/get.dart';
import 'package:pull_up/model/api_response_model.dart';
import 'package:pull_up/model/income_model.dart';

import '../services/api_service.dart';
import '../utils/app_url.dart';
import '../utils/app_utils.dart';

class IncomeController extends GetxController {
  Status status = Status.completed;

  String selectedChoice = 'This Month';
  String incomeListChoice = 'This Month';

  final List<String> choices = ['This Month', 'This Day'];

  IncomeModel? incomeModel;
  num totalIncome = 0;

  List incomes = [];

  currentBalance(String value) async {
    selectedChoice = value;
    update();
    String endpoint = "";
    if (selectedChoice == "This Day") {
      DateTime dateTime = DateTime.now();
      endpoint = "date=${dateTime.year}-${dateTime.month}-${dateTime.day}";
    } else {
      DateTime dateTime = DateTime.now();
      endpoint = "month=${dateTime.month}&year=${dateTime.year}";
    }

    incomeBalanceRepo(endpoint);
  }

  Future<void> incomeBalanceRepo(String value) async {
    incomes.clear();
    status = Status.loading;
    update();
    var response = await ApiService.getApi(
      "${AppUrl.income}?$value",
    );

    if (response.statusCode == 200) {
      incomeModel = IncomeModel.fromJson(jsonDecode(response.body));
      if (incomeModel?.data != null) {
        incomes.addAll(incomeModel!.data!);
      }
      calculation();
      status = Status.completed;
      update();
    } else {
      status = Status.error;
      update();
      Utils.snackBarMessage(response.statusCode.toString(), response.message);
    }
  }

  calculation() {
    if (incomeModel?.data != null) {
      totalIncome = 0;
      for (var item in incomeModel!.data!) {
        if (item.paymentData?.amount != null) {
          totalIncome = totalIncome + item.paymentData!.amount!;
        }
      }

      totalIncome = (totalIncome / 100);
      update();
      print("totalIncome doller====================> $totalIncome");
    }
  }

  String getGreeting() {
    var hour = DateTime.now().hour;

    if (hour < 6) {
      return ' ';
    } else if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else if (hour < 21) {
      return 'Good Evening';
    } else {
      return ' ';
    }
  }
}
