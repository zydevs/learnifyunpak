import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/app_export.dart';
import 'courselist_item_model.dart';

class MycoursesallTabModel {
  Rx<List<CourselistItemModel>> courselistItemList = Rx([]);

  MycoursesallTabModel() {
    _loadCoursesFromFirestore();
  }

  void _loadCoursesFromFirestore() {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid == null) {
      print('User not logged in');
      return;
    }

    FirebaseFirestore.instance
        .collection('selectedCourses')
        .where('fullName', isEqualTo: uid) // Filter berdasarkan pengguna saat ini
        .snapshots()
        .listen((snapshot) {
      final List<CourselistItemModel> courses = snapshot.docs.map((doc) {
        final data = doc.data();
        return CourselistItemModel(
          covercourse: (data['covercourse'] ?? ImageConstant.imgNotFound).toString().obs,
          namecourse: (data['namecourse'] ?? 'Unknown Course').toString().obs,
          lecture: (data['lecturer'] ?? 'Unknown Lecturer').toString().obs,
          requiredCourse: ImageConstant.imgClassIcon.obs, // Tetap statis
          requiredCourse1: (data['catcourse'] ?? 'Required Course').toString().obs,
          learned: (data['learned'] ?? 'Learned').toString().obs,
          completed: "0% Completed".obs, // Tetap statis
          image: ImageConstant.imgContrast.obs, // Tetap statis
          onehundredfifty: "0".obs, // Tetap statis
        );
      }).toList();

      courselistItemList.value = courses;
    });
  }
}
