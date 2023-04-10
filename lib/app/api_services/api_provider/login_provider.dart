import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';
import 'package:turbonmobility/app/controller/login_controller.dart';

import '../../screens/register/registerview.dart/otp_view.dart';

class LoginProvider {
  Dio client;
  LoginProvider({required this.client});
  var jsonResponse;
  var logToken;
  var user;
  var name;

  Login(
    String phone,
  ) async {
    final LoginController loginController = Get.put(LoginController());
    Map body = {
      "phone": phone,
    };

    try {
      loginController.isLoading.value = true;
      Response response =
          await client.post('/api/v1/users/sendotp', data: json.encode(body));

      if (response.statusCode == 200) {
        loginController.isLoading.value = false;
        Get.snackbar("Your Otp is ${response.data["otp"]}", "");

        Get.to(() => const OtpView());
        //  MyRouter.pushNamed(MyRoutes.bottom);
      } else {
        loginController.isLoading.value = false;
      }
      // else {
      //   // return Future.error(response.data["error"]);
      // }
    } on DioError catch (e) {
      loginController.isLoading.value = false;

      return Future.error(e.message);
    }
  }
}
