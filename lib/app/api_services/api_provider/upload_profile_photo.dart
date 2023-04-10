// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart' as g;
// import 'package:get/get_core/src/get_main.dart';
// import 'package:turbonmobility/controller/account_details_controller.dart';
// import 'package:turbonmobility/controller/upload_profile_controller.dart';
// import 'package:turbonmobility/core/helper.dart';

// import '../../view/serviceUnavailable_view/serviceUnavailable.dart';

// class UploadProfilePhotoProvider {
//   Dio client;
//   UploadProfilePhotoProvider({required this.client});

//   uploadProfilePhoto(
//     String path,
//   ) async {
//     FormData formData = FormData.fromMap({
//       "profile": await MultipartFile.fromFile(path),
//     });
//     final AccountDetailController accountDetailController =
//         Get.put(AccountDetailController());

//     final UploadProfileController uploadProfileController = Get.find();
//     try {
//       uploadProfileController.isLoading.value = true;
//       Response response =
//           await client.post('/api/users/upload', data: formData);

//       if (response.statusCode == 200) {
//         accountDetailController.callUserDetails().then(
//           (value) {
//             uploadProfileController.isLoading.value = false;
//             Helper().getCustomSnackbar(
//                 msg: "Profile Updated",
//                 subtitle: "Your Profile has been Updated Successfully",
//                 color: Colors.green);
//           },
//         );
//       } else {
//         g.Get.to(() => ServiceUnavailableScreen());
//         uploadProfileController.isLoading.value = false;
//         return Future.error(response.data["error"]);
//       }
//     } on DioError catch (e) {
//       uploadProfileController.isLoading.value = false;
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
