import '../../../core/app_export.dart';
import 'courselist_item_model.dart';




class MycoursesallTabModel {
  Rx<List<CourselistItemModel>> courselistItemList = Rx([
    CourselistItemModel(
        dataMiningOne: ImageConstant.imgRc3.obs,
        datamining: "Data Mining".obs,
        drfajardelli: "Dr. Fajar Delli W., M.M, M.Kom".obs,
        requiredCourse: ImageConstant.imgClassIcon.obs,
        requiredCourse1: "Required Course".obs,
        completed: "35 Completed".obs,
        learned: "Learned".obs,
        image: ImageConstant.imgContrast.obs,
        onehundredfifty: "150".obs),
    CourselistItemModel(
        dataMiningOne: ImageConstant.imgRc4.obs,
        datamining: "Teknik Simulasi".obs,
        drfajardelli: "Dr. Eneng Tita T., M.Si., M.Kom".obs,
        requiredCourse: imageConstant.imgClassIcon.obs,
        requiredCourse1: "Required Course".obs,
        completed: "35% Completed".obs,
        image: ImageConstant.imgContrast.obs,
        onehundredfifty: "150".obs),
    CourselistItemModel(
        dataMiningOne: ImageConstant.imgEc1.obs,
        datamining: "Sistem Informasi Geografis".obs,
        completed: "35% Completed".obs),
    CourselistItemModel(dataMiningOne: ImageConstant.imgEc2.obs)
  ]);
}
