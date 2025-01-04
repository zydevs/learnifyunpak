import 'package:flutter/material.dart';
import'../../../core/app_export.dart';
import '../models/login_model.dart';


class LoginController extends GetxController {
  TextEditingController usernameInputController= TextEditingController();
  TextEditingController passwordInputController= TextEditingController();

  Rx<LoginModel> registerModel0bj = LoginModel().obs;

  @override
  void onClose(){
    super.onClose();
    usernameInputController.dispose();
    passwordInputController.dispose();
  }
}
