// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_export.dart';
import '../models/coursegrid_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  // Tab controller
  late TabController tabViewController;
  var tabIndex = 0.obs;

  // Search controller
  var searchController = TextEditingController();

  // Observable lists
  var allCourses = <CoursegridItemModel>[].obs; // Semua kursus dari Firestore
  var filteredCourses = <CoursegridItemModel>[].obs; // Kursus yang difilter

  // Menyimpan kategori filter saat ini
  var currentCategory = 'All'.obs; // Default ke "All"

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi TabController
    tabViewController = TabController(length: 3, vsync: this);
    tabViewController.addListener(() {
      tabIndex.value = tabViewController.index;
    });

    // Fetch data saat inisialisasi
    fetchCoursesFromFirestore();
  }

  /// Fungsi untuk mengambil data dari Firestore
  Future<void> fetchCoursesFromFirestore() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('courses').get();

      final courseList = snapshot.docs.map((doc) {
        final data = doc.data();

        // Peta nilai string menjadi konstanta gambar
        String covercoursePath = data['covercourse'] ?? '';
        String covercourse = mapCovercourse(covercoursePath);

        return CoursegridItemModel(
          covercourse: covercourse,
          namecourse: RxString(data['namecourse'] ?? ''),
          lecturer: RxString(data['lecturer'] ?? ''),
          catcourse: RxString(data['catcourse'] ?? ''),
          learned: RxString(data['learned'] ?? 'Learned'),
        );
      }).toList();

      allCourses.assignAll(courseList);
      filteredCourses.assignAll(allCourses); // Inisialisasi dengan semua data
      print('Fetched courses: ${allCourses.length}');
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }

  // Fungsi untuk memetakan string menjadi konstanta gambar
  String mapCovercourse(String covercoursePath) {
    switch (covercoursePath) {
      case 'imgRc1':
        return ImageConstant.imgRc1;
      case 'imgRc2':
        return ImageConstant.imgRc2;
      case 'imgRc3':
        return ImageConstant.imgRc3;
      case 'imgRc4':
        return ImageConstant.imgRc4;
      case 'imgEc1':
        return ImageConstant.imgEc1;
      case 'imgEc2':
        return ImageConstant.imgEc2;
      default:
        return ''; // Nilai default jika tidak ditemukan
    }
  }

  // Fungsi untuk menyaring kursus berdasarkan kategori
  void filterCourses(String category) {
    currentCategory.value = category; // Update kategori saat ini
    if (category == 'All') {
      filteredCourses.assignAll(allCourses);
    } else {
      filteredCourses.assignAll(
        allCourses.where((course) => course.catcourse.value == category).toList(),
      );
    }
    print('Filtered courses for $category: ${filteredCourses.length}');
  }

  // Fungsi untuk memfilter berdasarkan teks pencarian
  void filterBySearch(String query) {
    if (query.isEmpty) {
      // Gunakan kategori saat ini untuk filter ulang
      filterCourses(currentCategory.value);
    } else {
      filteredCourses.assignAll(
        allCourses.where((course) =>
            course.namecourse.value.toLowerCase().contains(query.toLowerCase()) ||
            course.lecturer.value.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
    print('Courses filtered by search query "$query": ${filteredCourses.length}');
  }

  @override
  void onReady() {
    super.onReady();
    // Jalankan filter berdasarkan kategori default saat controller siap
    filterCourses(currentCategory.value);
  }

  @override
  void onClose() {
    // Dispose controllers
    tabViewController.dispose();
    searchController.dispose();
    super.onClose();
  }
}
