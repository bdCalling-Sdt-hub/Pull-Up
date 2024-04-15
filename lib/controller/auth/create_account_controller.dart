import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {


  TextEditingController emailController = TextEditingController() ;
  TextEditingController nameController = TextEditingController() ;
  TextEditingController numberController = TextEditingController() ;
  TextEditingController passwordController = TextEditingController() ;
  TextEditingController confirmControllerController = TextEditingController() ;


  RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp passRegExp = RegExp(r'(?=.*[a-z])(?=.*[0-9])');
}
