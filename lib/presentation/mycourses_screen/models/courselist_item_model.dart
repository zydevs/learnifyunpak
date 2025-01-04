import '../../../core/app_export.dart';

//

// ignore_for_file: must_be_immutable
class CourselistItemModel {
  CourselistItemModel(
      {this.covercourse,
      this.namecourse,
      this.lecture,
      this.requiredCourse,
      this.requiredCourse1,
      this.completed,
      this.learned,
      this.image,
      this.onehundredfifty,
      this.id}) {
    covercourse = covercourse ?? Rx(ImageConstant.imgRc3);
    namecourse = namecourse ?? Rx("Data Mining");
    lecture = lecture ?? Rx("Dr. Fajar Delli W., M.M., M.Kom");
    requiredCourse = requiredCourse ?? Rx(ImageConstant.imgClassIcon);
    requiredCourse1 = requiredCourse1 ?? Rx("Required Course");
    completed = completed ?? Rx("35% Completed");
    learned = learned ?? Rx("Learned");
    image = image ?? Rx(ImageConstant.imgContrast);
    onehundredfifty = onehundredfifty ?? Rx("150");
    id = id ?? Rx("");
  }

  Rx<String>? covercourse;

  Rx<String>? namecourse;

  Rx<String>? lecture;

  Rx<String>? requiredCourse;

  Rx<String>? requiredCourse1;

  Rx<String>? completed;

  Rx<String>? learned;

  Rx<String>? image;

  Rx<String>? onehundredfifty;

  Rx<String>? id;
}
