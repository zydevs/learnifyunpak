import 'package:flutter/material.dart';
import'../../../core/app_export.dart';
import '../models/register_model.dart';


class RegisterController extends GetxController {
  final emailInputController = TextEditingController();
  final fullNameInputController= TextEditingController();
  final passwordInputController= TextEditingController();
  final confirmPasswordInputController = TextEditingController();

  Rx<RegisterModel> registerModel0bj = RegisterModel().obs;

  @override
  void onClose(){
    super.onClose();
    emailInputController.dispose();
    fullNameInputController.dispose();
    passwordInputController.dispose();
    confirmPasswordInputController.dispose();
  }

}