import 'package:coincrux/screens/LatestLandingScreen.dart';
import 'package:coincrux/screens/dashboard/dashboard_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/auth/login_page.dart';

import '../screens/auth/otp_page.dart';
import '../screens/dashboard/home/bookmarks/bookmarks.dart';
import '../screens/splash/splash_view.dart';
import 'app_routes.dart';

abstract class AppPages {
  static List<GetPage> pages = [
      GetPage(name: Routes.splash, page: () =>  const SplashScreen()),
      GetPage(name: Routes.dashBoardPage, page: () =>   DashBoardPage()),
      GetPage(name: Routes.oTPView, page: () =>   OTPView()),
      GetPage(name: Routes.bookmark, page: () =>   Bookmark()),

      GetPage(name: Routes.loginView, page: () =>   LoginView()),
    GetPage(name: Routes.landing, page: () =>   LatestLandingScreen()),





  ];
}
