import '../../../core/app_export.dart';
import 'courselist_item_model.dart';




class MycoursesallTabModel {
  Rx<List<CourselistItemModel>> courselistItemList = Rx([
    CourselistItemModel(
        covercourse: ImageConstant.imgRc3.obs,
        namecourse: "Data Mining".obs,
        lecture: "Dr. Fajar Delli W., M.M, M.Kom".obs,
        requiredCourse: ImageConstant.imgClassIcon.obs,
        requiredCourse1: "Required Course".obs,
        completed: "35 Completed".obs,
        learned: "Learned".obs,
        image: ImageConstant.imgContrast.obs,
        onehundredfifty: "150".obs),
    CourselistItemModel(
        covercourse: ImageConstant.imgRc4.obs,
        namecourse: "Teknik Simulasi".obs,
        lecture: "Dr. Eneng Tita T., M.Si., M.Kom".obs,
        requiredCourse: ImageConstant.imgClassIcon.obs,
        requiredCourse1: "Required Course".obs,
        completed: "35% Completed".obs,
        image: ImageConstant.imgContrast.obs,
        onehundredfifty: "150".obs),
    CourselistItemModel(
        covercourse: ImageConstant.imgEc1.obs,
        namecourse: "Sistem Informasi Geografis".obs,
        completed: "35% Completed".obs),
    CourselistItemModel(covercourse: ImageConstant.imgEc2.obs)
  ]);
}
