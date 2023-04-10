// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart' as g;
// import 'package:get/get_core/src/get_main.dart';

// class InviteCodeProvider {
//   Dio client;
//   InviteCodeProvider({required this.client});

//   Future<void> getInviteCode() async {
//     final InviteCodeController inviteCodeController = Get.find();

//     try {
//       inviteCodeController.isLoading.value = true;
//       Response response = await client.get(
//         '/api/users/getInviteCode',
//       );

//       if (response.statusCode == 200) {
//         inviteCodeController.inviteCode.value =
//             response.data["inviteCode"]["code"];
//         inviteCodeController.isLoading.value = false;
//       } else {
//         inviteCodeController.isLoading.value = false;
//       }
//     } on DioError catch (e) {
//       inviteCodeController.isLoading.value = false;
//       // Helper().getCustomSnackbar(
//       //     msg: e.response!.data, subtitle: "", color: Colors.redAccent);

//       return Future.error(e.message);
//     }
//   }
// }
