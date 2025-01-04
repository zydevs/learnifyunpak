import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/profile_model.dart';

class ProfileController extends GetxController {
  Rx<ProfileModel> profileModelObj = ProfileModel().obs;
}
