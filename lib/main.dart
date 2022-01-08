import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/commonconstants/Colors_Constants.dart';
import 'package:flutter_demo/configration/App_Routes.dart';
import 'package:flutter_demo/configration/App_Screens.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.SPLASH_SCREEN,
      getPages: AppScreens.list,
      title: 'First App',
    );
  }
}
