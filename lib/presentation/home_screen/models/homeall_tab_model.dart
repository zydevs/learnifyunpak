import '../../../core/app_export.dart';
import 'coursegrid_item_model.dart';

//

//
class HomeallTabModel {
  Rx<List<CoursegridItemModel>> coursegridItemList = Rx([
    CoursegridItemModel(
        covercourse: ImageConstant.imgRc1.obs,
        namecourse: "Software Testing".obs,
        lecturer: "Boldson Herdianto S, MMSI.".obs,
        catcourse: "Required Course".obs),
    CoursegridItemModel(
        covercourse: ImageConstant.imgRc2.obs,
        namecourse: "Analisis Perancangan Sistem".obs,
        lecturer: "Adriana Sari Aryani., M.Cs.".obs,
        catcourse: "Required Course".obs),
    CoursegridItemModel(
        covercourse: ImageConstant.imgRc3.obs,
        namecourse: "Data Mining".obs,
        lecturer: "Dr. Fajar Delli W., M.M., M.Kom".obs,
        catcourse: "Required Course".obs),
    CoursegridItemModel(
        covercourse: ImageConstant.imgRc4.obs,
        namecourse: "Teknik Simulasi".obs,
        lecturer: "Dr. Eneng Tita T ., M.Si., M.Kom,".obs,
        catcourse: "Required Course".obs),
    CoursegridItemModel(
        covercourse: ImageConstant.imgEc1.obs,
        namecourse: "Sistem Informasi Geografis".obs,
        lecturer: "Asep Denih, S.Kom., M.Sc., Ph.D.".obs,
        catcourse: "Elective Course".obs),
    CoursegridItemModel(
        covercourse: ImageConstant.imgEc2.obs,
        namecourse: "Mobile Programming".obs,
        lecturer: "Agung Prajuhana P., M.Kom.".obs,
        catcourse: "Required Course".obs)
  ]);
}
