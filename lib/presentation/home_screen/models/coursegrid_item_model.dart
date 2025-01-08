import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CoursegridItemModel {
  String covercourse;
  RxString namecourse;
  RxString lecturer;
  RxString catcourse;
  RxString learned;

  CoursegridItemModel({
    required this.covercourse,
    required this.namecourse,
    required this.lecturer,
    required this.catcourse,
    required this.learned,
  });

  // Factory constructor untuk pemetaan dari Firebase
  factory CoursegridItemModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return CoursegridItemModel(
      covercourse: data['covercourse'] ?? '',
      namecourse: (data['namecourse'] ?? '').obs,
      lecturer: (data['lecturer'] ?? '').obs,
      catcourse: (data['catcourse'] ?? '').obs,
      learned: (data['learned'] ?? 'Learned').obs,
    );
  }
}
