import '../../../core/app_export.dart';
import '../controller/splashscreen_controller.dart';

/// A binding class for the SplashscreenScreen.
/// 
/// This class ensures that the SplashscreenController is created when the 
/// SplashscreenScreen is firts loaded.
class SpalshscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashscreenController());
  }
}