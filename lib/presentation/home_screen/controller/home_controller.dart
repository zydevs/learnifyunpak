import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/home_initial_model.dart';
import '../models/home_model.dart';
import '../models/homeall_tab_model.dart';

//
//
//
//
class HomeController extends GetController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  Rx<HomeModel> homeModelObj = HomeModel().obs;

  late TabController tabViewController =
      Get.put(TabController(vsync: this, length: 3));

  Rx<int> tabIndex = 0.obs;

  Rx<HomeallTabModel> homeallTabModelObj = HomeallTabModel().obs;

  Rx<HomeIniitialModel> homeallInitialObj = HomeaInitialModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
