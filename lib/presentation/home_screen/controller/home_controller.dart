import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_export.dart';
import '../models/coursegrid_item_model.dart';
import '../models/homeall_tab_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  // Controller untuk pencarian
  TextEditingController searchController = TextEditingController();

  // Indeks untuk tab
  Rx<int> tabIndex = 0.obs;

  // TabController untuk mengelola tab
  late TabController tabViewController;

  // Objek HomeallTabModel
  Rx<HomeallTabModel> homeallTabModelObj =
      HomeallTabModel(coursegridItemList: RxList<CoursegridItemModel>()).obs;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi TabController
    tabViewController = TabController(vsync: this, length: 3);
    // Ambil data dari Firestore
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
        );
      }).toList();

      homeallTabModelObj.update((model) {
        model?.coursegridItemList.value = courseList;
      });
    } catch (e) {
      print('Error fetching courses: $e');
    }
  }

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

  @override
  void onClose() {
    super.onClose();
    // Hapus resource yang tidak diperlukan
    searchController.dispose();
    tabViewController.dispose();
  }
}
