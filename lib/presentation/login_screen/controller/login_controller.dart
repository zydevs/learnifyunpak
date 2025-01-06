import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/login_model.dart';

class LoginController extends GetxController {
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  // TextEditingController emailInputController= TextEditingController();
  // TextEditingController passwordInputController= TextEditingController();

  Rx<LoginModel> registerModel0bj = LoginModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailInputController.dispose();
    passwordInputController.dispose();
  }
}
