// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart' as g;
// import 'package:get/get_core/src/get_main.dart';

// class RegisterProvider {
//   Dio client;
//   RegisterProvider({required this.client});

//   register(
//     String name,
//     String phone,
//     String email,
//     String gender,
//     String datebirth,
//     String password,
//     double long,
//     double lat,
//   ) async {
//     Map body = {
//       "fullName": name,
//       "phone": phone,
//       "email": email,
//       'gender': gender,
//       'birthDate': datebirth,
//       'password': password,
//       "lngLat": [long, lat]
//     };
//     final RegisterController registerController = Get.put(RegisterController());
//     try {
//       registerController.isLoading.value = true;
//       Response response =
//           await client.post('/api/users/register', data: json.encode(body));

//       if (response.statusCode == 201) {
//         Helper().getCustomSnackbar(
//             msg: "Successfully registered",
//             subtitle: "your account has been registered",
//             color: Colors.greenAccent);
//         Get.to(() => OtpScreen());
//         registerController.isLoading.value = false;
//       } else {
//         g.Get.to(() => ServiceUnavailableScreen());
//         registerController.isLoading.value = false;
//         return Future.error(response.data["error"]);
//       }
//     } on DioError catch (e) {
//       registerController.isLoading.value = false;
//       Helper().getCustomSnackbar(
//           msg: e.response!.data["msg"], subtitle: "", color: Colors.redAccent
//           // buttonMain: TextButton(
//           //     onPressed: () {
//           //       Get.offAll(LoginScreen());
//           //     },
//           //     child: const Text("LogIn")),
//           );

//       //
//       return Future.error(e.message);
//     }
//   }

 
// }
