import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/commonconstants/Colors_Constants.dart';
import 'package:flutter_demo/commonconstants/Image_Constants.dart';
import 'package:flutter_demo/configration/App_Routes.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    Timer(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
    Future.delayed(Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.FIRST_SCREEN);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorCommonConstants.LIGHTBLUECOLOR,
        body: SlideTransition(
          position: Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
              .animate(_animationController),
          child: FadeTransition(
            opacity: _animationController,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                ImageCommonConstants.SPLASH_IMAGE,
                height: 120.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
