import '../../../core/app_export.dart';
import '../controller/mycourses_controller.dart';

class MycoursesBinding extends Bindings {
  @override
  void dependencies() {
    print("Binding MycoursesController dipanggil");
    Get.lazyPut<MycoursesController>(() => MycoursesController());
  }
}
