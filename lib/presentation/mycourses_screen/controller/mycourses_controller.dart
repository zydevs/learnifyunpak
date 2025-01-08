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

  // Daftar semua kursus yang diambil dari Firestore
  List<CourselistItemModel> allCourses = [];

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi TabController
    tabviewController = TabController(vsync: this, length: 3);

    // Memuat data dari Firestore
    _fetchSelectedCourses();

    // Tambahkan listener untuk pencarian
    searchController.addListener(_filterCourses);
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
      allCourses = snapshot.docs.map((doc) {
        return CourselistItemModel(
          covercourse: Rx(doc['covercourse'] ?? ''),
          namecourse: Rx(doc['namecourse'] ?? 'Unknown Course'),
          lecture: Rx(doc['lecturer'] ?? 'Unknown Lecturer'),
          requiredCourse1: Rx(doc['catcourse'] ?? 'General Course'),
          completed: Rx('0% Completed'), // Data statis
        );
      }).toList();

      // Menampilkan semua data saat awal
      mycoursesallTabModelObj.value.courselistItemList.value = allCourses;
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }

  // Fungsi untuk memfilter kursus berdasarkan input pencarian
  void _filterCourses() {
    String query = searchController.text.toLowerCase();

    // Filter daftar kursus berdasarkan namecourse atau lecturer
    List<CourselistItemModel> filteredCourses = allCourses.where((course) {
      return course.namecourse.value.toLowerCase().contains(query) ||
          course.lecture.value.toLowerCase().contains(query);
    }).toList();

    // Memperbarui model observasi dengan data yang difilter
    mycoursesallTabModelObj.value.courselistItemList.value = filteredCourses;
  }
}
