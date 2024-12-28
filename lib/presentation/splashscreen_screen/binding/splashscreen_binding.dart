import '../../../core/app_export.dart';
import '../controller/splashscreen_controller.dart';

/// A binding class for the SplashscreeScreen.
/// 
/// This class ensures that the SplashscreenController is created when the
/// SplashscreenScreen is first loaded.
class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashscreenController());
  }
}