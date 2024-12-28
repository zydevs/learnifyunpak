import '../../../core/app_export.dart';

//

//
class CoursegridItemModel {
  CoursegridItemModel(
      {this.covercourse,
      this.namecourse,
      this.lecturer,
      this.catcourse,
      this.id}) {
    covercourse = covercourse ?? Rx(ImageConstant.imgRc1);
    namecourse = namecourse ?? Rx("Software Testing");
    lecturer = lecturer ?? Rx("Boldson Herdianto S, MMSI.");
    catcourse = catcourse ?? Rx("Required Course");
    id = id ?? Rx("");
  }

  Rx<String>? covercourse;
  
  Rx<String>? namecourse;

  Rx<String>? lecturer;

  Rx<String>? catcourse;

  Rx<String>? id;
}
