// import 'package:parveen_frontend/core/package.dart';

// class OtpController extends GetxController {
//   TextEditingController otp = TextEditingController();
// }

// import 'package:parveen_frontend/core/package.dart';

// class OtpController extends GetxController {
//   TextEditingController otp = TextEditingController();
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:turbonmobility/app/controller/login_controller.dart';

import '../api_services/api_client/api_client.dart';
import '../api_services/api_provider/otp_verify_provider.dart';

class OtpController extends GetxController {
  final LoginController _loginController = Get.put(LoginController());
  RxInt elapsedTime = 60.obs;
  // int _start = 120;

  RxBool enableResend = false.obs;

  String result = '';
  GlobalKey<FormState> otpforgetKey = GlobalKey<FormState>();

  TextEditingController otp = TextEditingController();

  late final Timer timer;
  String? otpValidator(value) {
    if (value.length == 0) {
      return 'Plese enter otp';
    } else {
      return null;
    }
  }

  RxBool isLoading = false.obs;
  var token;
  void resendCode() {
    elapsedTime.value = 60;
    enableResend.value = false;
    startTimer();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (elapsedTime.value != 0) {
        elapsedTime.value--;
      } else {
        enableResend.value = true;
      }
    });
  }

  @override
  void onClose() {
    // otp.dispose();
    timer.cancel();
    super.onClose();
  }

  @override
  void onReady() {
    startTimer();
    super.onReady();
  }

  callOtp() {
    Client client = Client();

    OtpProvider(client: client.init()).VerifyOtp(otp.text);
  }
}
