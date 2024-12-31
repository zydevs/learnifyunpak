import '../../../core/app_export.dart';




class CourselistItemModel {
  CourselistItemModel(
      {this.dataMiningOne,
      this.datamining,
      this.drfajardelli,
      this.requiredCourse,
      this.requiredCourse1,
      this.completed,
      this.learned,
      this.image,
      this.onehundredfifty,
      this.id}) {
    dataMiningOne = dataMiningOne ?? Rx(ImageConstant.imgRc3);
    datamining = datamining ?? Rx("Data Mining");
    drfajardelli = drfajardelli ?? Rx("Dr. Fajar Delli W., M.M., M.Kom");
    requiredCourse = requiredCourse ?? Rx(ImageConstant.imgClassIcon);
    requiredCourse1 = requiredCourse1 ?? Rx("Required Course");
    completed = completed ?? Rx("35% Completed");
    learned = learned ?? Rx("Learned");
    image = image ?? Rx(ImageConstant.imgContrast);
    onehundredfifty = onehundredfifty ?? Rx("150");
    id = id ?? Rx("");
  }

  Rx<String>? dataMiningOne;

  Rx<String>? datamining;

  Rx<String>? drfajardelli;

  Rx<String>? requiredCourse;

  Rx<String>? requiredCourse1;

  Rx<String>? completed;

  Rx<String>? learned;

  Rx<String> image;

  Rx<String>? onehundredfifty;

  Rx<String>? id;
}
