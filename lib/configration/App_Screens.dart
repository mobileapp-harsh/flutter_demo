import 'package:flutter_demo/configration/App_Routes.dart';
import 'package:flutter_demo/modules/firstScreen/screen/First_Screen.dart';
import 'package:flutter_demo/modules/splashscreen/screen/Splash_Screen.dart';
import 'package:get/get.dart';

class AppScreens {
  static var list = [
    GetPage(name: AppRoutes.SPLASH_SCREEN, page: () => SplashScreen()),
    GetPage(name: AppRoutes.FIRST_SCREEN, page: () => FirstScreen()),
  ];
}
