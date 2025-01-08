import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/mycourses_model.dart';
import '../models/mycoursesall_tab_model.dart';
import '../models/courselist_item_model.dart';

class MycoursesController extends GetxController with GetSingleTickerProviderStateMixin {
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

    // Memuat data dari Firestore
    _fetchSelectedCourses();
  }

  @override
  void onClose() {
    super.onClose();
    // Dispose TabController dan TextEditingController
    tabviewController.dispose();
    searchController.dispose();
  }

  // Fungsi untuk memuat data dari Firestore
  void _fetchSelectedCourses() async {
    try {
      // Mengambil data dari Firestore
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('selectedCourses')
          .orderBy('timestamp', descending: true)
          .get();

      // Konversi data ke dalam model CourselistItemModel
      List<CourselistItemModel> courses = snapshot.docs.map((doc) {
        return CourselistItemModel(
          covercourse: Rx(doc['covercourse'] ?? ''),
          namecourse: Rx(doc['namecourse'] ?? 'Unknown Course'),
          lecture: Rx(doc['lecturer'] ?? 'Unknown Lecturer'),
          requiredCourse1: Rx(doc['catcourse'] ?? 'General Course'),
          completed: Rx('0% Completed'), // Data statis
        );
      }).toList();

      // Memperbarui model observasi
      mycoursesallTabModelObj.value.courselistItemList.value = courses;
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }
}
