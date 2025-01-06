import 'package:learnifyunpak/presentation/auth_page/auth_page.dart';

import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import '../presentation/home_screen/binding/home_binding.dart';
import '../presentation/home_screen/home_screen.dart';
import '../presentation/login_screen/binding/login_binding.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/mycourses_screen/binding/mycourses_binding.dart';
import '../presentation/mycourses_screen/mycourses_screen.dart';
import '../presentation/profile_screen/binding/profile_binding.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/register_screen/binding/register_binding.dart';
import '../presentation/register_screen/register_screen.dart';
import '../presentation/splashscreen_screen/binding/splashscreen_binding.dart';
import '../presentation/splashscreen_screen/splashscreen_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String splashscreenScreen = '/splashscreen_screen';
  
  static const String authPage = '/auth_page';

  static const String loginScreen = '/login_screen';

  static const String registerScreen = '/register_screen';

  static const String homeScreen = '/home_screen';

  static const String homeallTabPage = '/homeall_tab_page';

  static const String homeInitialPage = '/home_initial_page';

  static const String mycoursesScreen = '/mycourses_screen';

  static const String mycoursesallTabPage = '/mycousesall_tab_page';

  static const String profileScreen = '/profile_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: splashscreenScreen,
      page: () => SplashscreenScreen(),
      bindings: [SplashscreenBinding()],
    ),
    GetPage(
      name: authPage, 
      page: () => AuthPage(),
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
      bindings: [RegisterBinding()],
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: mycoursesScreen,
      page: () => MycoursesScreen(),
      bindings: [MycoursesBinding()],
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      bindings: [ProfileBinding()],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [AppNavigationBinding()],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashscreenScreen(),
      bindings: [SplashscreenBinding()],
    )
  ];
}