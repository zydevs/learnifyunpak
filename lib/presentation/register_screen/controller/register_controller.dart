import 'package:flutter/material.dart';
import'../../../core/app_export.dart';
import '../models/register_model.dart';


class RegisterController extends GetxController {
  TextEditingController emailInputController = TextEditingController();
  TextEditingController usernameInputController= TextEditingController();
  TextEditingController passwordInputController= TextEditingController();
  TextEditingController repeatPasswordInputController = TextEditingController();

  Rx<RegisterModel> registerModel0bj = RegisterModel().obs;

  @override
  void onClose(){
    super.onClose();
    emailInputController.dispose();
    usernameInputController.dispose();
    passwordInputController.dispose();
    repeatPasswordInputController.dispose();
  }

}