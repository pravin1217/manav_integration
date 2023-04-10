import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/otp_controller.dart';
import '../../routes/app_router.dart';
import '../../routes/app_routes.dart';
import '../../sharedpreferences/shared_preferences.dart';

class OtpProvider {
  Dio client;
  OtpProvider({required this.client});

  var jsonResponse;
  var logToken;
  var userId;
  var name;
  final OtpController otpController = Get.put(OtpController());
  // final AccountDetailController accountDetailController =
  //     Get.put(AccountDetailController());

  VerifyOtp(
    String otp,
  ) async {
    otpController.isLoading.value = true;
    try {
      // CommanLoader.loader();
      var body = {
        "otp": otp,
      };

      Response r =
          await client.post("/api/v1/users/verify", data: json.encode(body));

      if (r.statusCode == 200) {
        // var data = json.decode(r.data);
        logToken = r.data['token'];

        userId = r.data['userId'];
        SharedToken().userId_save(userId);
        SharedToken().token_save(logToken);
        // final box = GetStorage();
        // box.write('phone', data['phone']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);
        MyRouter.pushNamed(MyRoutes.bottom);
        //   accountDetailController.callUserDetails();
        //   accountDetailController
        //       .callUserDetails()
        //       .then((value) => Timer(const Duration(seconds: 2), () async {
        //             bool isPermissionAllowed =
        //                 await locationController.isPermissionAllowed();

        //             if (isPermissionAllowed) {
        //               final DashboardController dashboardController =
        //                   Get.put(DashboardController());
        //               LocationController locationController =
        //                   Get.put(LocationController());
        //               locationController.getCurrentPosition();

        //               Get.offAll(() => const DashboardScreen());
        //             } else {
        //               Get.offAll(() => LocationPermissionHandlerScreen());
        //             }
        //           }));
        // });

        otpController.isLoading.value = false;
      } else {
        Get.snackbar(r.data["message"].toString(), "");
        otpController.isLoading.value = false;
        // CommanLoader.showErrorDialog(description: r.data['error']);
      }
    } on DioError {
      otpController.isLoading.value = false;

      otpController.isLoading.value = false;
    }
  }
}
