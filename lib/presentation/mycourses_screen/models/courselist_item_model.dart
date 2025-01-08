import '../../../core/app_export.dart';

// ignore_for_file: must_be_immutable
class CourselistItemModel {
  CourselistItemModel({
    Rx<String>? covercourse,
    Rx<String>? namecourse,
    Rx<String>? lecture,
    Rx<String>? requiredCourse,
    Rx<String>? requiredCourse1,
    Rx<String>? completed,
    Rx<String>? learned,
    Rx<String>? image,
    Rx<String>? onehundredfifty,
    Rx<String>? id,
  }) {
    this.covercourse = covercourse ?? Rx(ImageConstant.imgNotFound); // Default placeholder image
    this.namecourse = namecourse ?? Rx("Unknown Course");
    this.lecture = lecture ?? Rx("Unknown Lecturer");
    this.requiredCourse = requiredCourse ?? Rx(ImageConstant.imgClassIcon); // Default icon
    this.requiredCourse1 = requiredCourse1 ?? Rx("Required Course");
    this.completed = completed ?? Rx("0% Completed");
    this.learned = learned ?? Rx("Learned");
    this.image = image ?? Rx(ImageConstant.imgContrast);
    this.onehundredfifty = onehundredfifty ?? Rx("0");
    this.id = id ?? Rx("");
  }

  // Properti untuk data kursus
  late Rx<String> covercourse; // Gambar kursus
  late Rx<String> namecourse;  // Nama kursus
  late Rx<String> lecture;     // Nama dosen
  late Rx<String> requiredCourse;  // Ikon jenis kursus
  late Rx<String> requiredCourse1; // Deskripsi jenis kursus (dinamis dari Firestore)
  late Rx<String> completed;       // Status penyelesaian (statis)
  late Rx<String> learned;         // Status belajar (dinamis)
  late Rx<String> image;           // Ikon tambahan (statis)
  late Rx<String> onehundredfifty; // Jumlah (statis)
  late Rx<String> id;              // ID unik (jika diperlukan dari Firestore)

  // Fungsi untuk membuat model dari data Firestore
  factory CourselistItemModel.fromFirestore(Map<String, dynamic> data) {
    return CourselistItemModel(
      covercourse: Rx(data['covercourse'] ?? ImageConstant.imgNotFound),
      namecourse: Rx(data['namecourse'] ?? "Unknown Course"),
      lecture: Rx(data['lecturer'] ?? "Unknown Lecturer"),
      requiredCourse1: Rx(data['catcourse'] ?? "Required Course"),
      id: Rx(data['id'] ?? ""), // ID kursus, opsional
    );
  }

  // Fungsi untuk mengubah model ke format Map (jika perlu menyimpan kembali ke Firestore)
  Map<String, dynamic> toFirestore() {
    return {
      'covercourse': covercourse.value,
      'namecourse': namecourse.value,
      'lecturer': lecture.value,
      'catcourse': requiredCourse1.value,
      'id': id.value,
    };
  }
}
