import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/account_details_controller.dart';
import 'package:turbonmobility/app/screens/locationaccess/enablelocation.dart';
import 'package:turbonmobility/app/sharedpreferences/shared_preferences.dart';

import '../screens/bottomscreen/view/bottomscreen.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    var token = await SharedToken().userId_read();
    print(token);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.black));
    if (token.toString() != '') {
      AccountDetailController accountDetailController =
          Get.put(AccountDetailController());
      Timer(
          Duration(seconds: 2),
          () => accountDetailController.callUserDetails().then((value) {
                Get.offAll(BottomScreen());
              }));
    } else {
      Timer(
          const Duration(seconds: 2), () => Get.offAll(const EnableLocation()));
    }

    // getData();
  }
}
