// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart' as g;
// import 'package:get/get_core/src/get_main.dart';
// import 'package:turbonmobility/controller/location_controller.dart';
// import 'package:turbonmobility/controller/map_controller.dart';
// import 'package:turbonmobility/core/helper.dart';

// class LocationProvider {
//   Dio client;
//   LocationProvider({required this.client});
//   final LocationController locationController = Get.put(LocationController());
//   final MapController mapController = Get.put(MapController());
//   Future<void> getSaveCurrentLocation(
//       {required double lat, required double long}) async {
//     try {
//       Map body = {
//         "latLng": [lat, long]
//       };
//       locationController.isLoading.value = true;
//       Response response = await client.patch(
//         '/api/users/saveCurrentLocation',
//         data: json.encode(body),
//       );

//       if (response.statusCode == 200) {
//         locationController.isLoading.value = false;
//       } else {
//         locationController.isLoading.value = false;
//       }
//     } on DioError catch (e) {
//       locationController.isLoading.value = false;
//       Helper().getCustomSnackbar(
//           msg: e.response!.data, subtitle: "", color: Colors.redAccent);
//     }
//   }

//   Future<void> getCurrentLocation() async {
//     try {
//       locationController.isLoading.value = true;
//       Response response = await client.get(
//         '/api/users/getCurentLocation',
//       );

//       if (response.statusCode == 200) {
//         locationController.currentPosition.value = Position(
//           altitude: 0,
//           speed: 0,
//           accuracy: 0,
//           latitude: response.data["currentLocation"]["coordinates"][0],
//           longitude: response.data["currentLocation"]["coordinates"][1],
//           timestamp: DateTime.now(),
//           speedAccuracy: 0,
//           heading: 0,
//         );
//         mapController.goPickUpLocation(
//             response.data["currentLocation"]["coordinates"][0],
//             response.data["currentLocation"]["coordinates"][1]);

//         locationController.isLoading.value = false;
//       } else {
//         locationController.isLoading.value = false;
//       }
//     } on DioError catch (e) {
//       locationController.isLoading.value = false;
//       Helper().getCustomSnackbar(
//           msg: e.response!.data, subtitle: "", color: Colors.redAccent);
//     }
//   }
// }
