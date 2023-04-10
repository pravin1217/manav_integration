import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/splash_controller.dart';

import '../../core/colors/appcolors.dart';

class SplashScreen extends GetView {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashController splashController = Get.put(SplashController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Spacer(),
            Center(
              child: Image.asset(
                'asset/logo.png',
                height: 50,
              ),
            ),
            Center(
              child: Image.asset(
                'asset/c9.png',
                width: 130,
              ),
            ),
            Spacer(),
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(kcPrimary),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
