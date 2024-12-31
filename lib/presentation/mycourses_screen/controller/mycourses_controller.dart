import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/mycourses_model.dart';
import '../models/mycoursesall_tab_model.dart';

class MycoursesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  Rx<MycoursesModel> mycoursesModelObj = MycoursesModel().obs;

  late TabController tabviewController =
      Get.put(TabController(vsync: this, length: 3));

  Rx<int> tabIndex = 0.obs;

  Rx<MycoursesallTabModel> mycousesallTabModelObj = MycousesallTabModel().obs;

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
