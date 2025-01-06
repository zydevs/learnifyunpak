import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/mycourses_model.dart';
import '../models/mycoursesall_tab_model.dart';

class MycoursesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Controller untuk input pencarian
  TextEditingController searchController = TextEditingController();

  // Model observasi untuk MyCourses
  Rx<MycoursesModel> mycoursesModelObj = MycoursesModel().obs;

  // TabController untuk TabView
  late TabController tabviewController;

  // Indeks tab aktif
  Rx<int> tabIndex = 0.obs;

  // Model observasi untuk MyCoursesAll Tab
  Rx<MycoursesallTabModel> mycoursesallTabModelObj = MycoursesallTabModel().obs;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi TabController
    tabviewController = TabController(vsync: this, length: 3);
  }

  @override
  void onClose() {
    super.onClose();
    // Dispose TabController dan TextEditingController
    tabviewController.dispose();
    searchController.dispose();
  }
}
