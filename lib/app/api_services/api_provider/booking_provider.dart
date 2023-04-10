import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:turbonmobility/app/controller/booking_controller.dart';
import 'package:turbonmobility/app/controller/location_controller.dart';
import 'package:turbonmobility/app/core/constant.dart';
import 'package:turbonmobility/app/screens/home/controller/home_controller.dart';
import 'package:turbonmobility/app/sharedpreferences/shared_preferences.dart';

class BookingProvider {
  Dio client;
  BookingProvider({required this.client});

  Future<void> getAllBookings() async {
    BookingController bookingController = Get.find();
    bookingController.isBookingLoading.value = true;

    var userId = await SharedToken().userId_read();
    try {
      Response response = await client.get(
        '/api/v1/booking/endride/user/$userId',
      );

      if (response.statusCode == 200) {
        log(response.data.toString());

        bookingController.bookingList = response.data["message"];
      } else {
        bookingController.bookingList = [];
        bookingController.isBookingLoading.value = false;
      }
    } on DioError {
      bookingController.isBookingLoading.value = false;
    }
  }

  Future<void> getAllPackages() async {
    BookingController bookingController = Get.find();
    bookingController.isLoading.value = true;

    try {
      Response response = await client.get(
        '/api/v1/pack/pack/all',
      );

      if (response.statusCode == 200) {
        log(response.data.toString());
        bookingController.allPackages = response.data["message"];
        bookingController.isLoading.value = false;
      } else {
        bookingController.bookingList = [];
        bookingController.isLoading.value = false;
      }
    } on DioError {
      bookingController.isLoading.value = false;
    }
  }

  Future<void> getAllRide() async {
    BookingController bookingController = Get.find();
    bookingController.isLoading.value = true;

    var userId = await SharedToken().userId_read();
    try {
      Response response = await client.get(
        '/api/v1/location',
      );

      if (response.statusCode == 200) {
        //   log(response.data.toString());
        bookingController.allRideList = response.data["message"];
        try {
          LocationController locationController = Get.find();
          locationController.setSourceAndDestinationIcons();
        } catch (e) {
          log(">>>>>>>$e");
        }
        bookingController.isLoading.value = false;
      } else {
        bookingController.bookingList = [];
        bookingController.isLoading.value = false;
      }
    } on DioError {
      bookingController.isLoading.value = false;
    }
  }

  Future<void> getUnlockRide(unlockKey) async {
    BookingController bookingController = Get.find();
    bookingController.isLoading.value = true;
    var data = {"imei": unlockKey};
    var userId = await SharedToken().userId_read();
    try {
      Response response = await client.post('/api/v1/users/unlock/$userId',
          data: json.encode(data));

      if (response.statusCode == 200) {
        Get.back();
        Get.snackbar("Ride Unlocked", "Start Ride");
        bookingController.isLoading.value = false;
      } else {
        bookingController.bookingList = [];
        bookingController.isLoading.value = false;
      }
    } on DioError {
      bookingController.isLoading.value = false;
    }
  }

  Future<void> getEndRide(location) async {
    BookingController bookingController = Get.find();
    bookingController.isLoading.value = true;

    var userId = await SharedToken().userId_read();
    try {
      var body = {
        "userId": userId,
        "location": location,
      };
      Response response = await client.post(
        '/api/v1/booking/endride/$userId',
        data: json.encode(body),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        bookingController.isLoading.value = false;
        log(response.data.toString());
        bookingController.bookingList = response.data["message"];
      } else {
        bookingController.bookingList = [];
        bookingController.isLoading.value = false;
      }
    } on DioError {
      bookingController.isLoading.value = false;
    }
  }

  Future<void> getCreateBooking(time, distance) async {
    BookingController bookingController = Get.find();
    bookingController.isLoading.value = true;

    var userId = await SharedToken().userId_read();
    try {
      var body = {
        "time": time,
        "distance": distance,
      };
      Response response = await client.post(
        '/api/v1/booking/$userId',
        data: json.encode(body),
      );

      if (response.statusCode == 200) {
        bookingController.isLoading.value = false;
        log(response.data.toString());
        bookingController.bookingList = response.data["message"];
      } else {
        bookingController.bookingList = [];
        bookingController.isLoading.value = false;
      }
    } on DioError {
      bookingController.isLoading.value = false;
    }
  }

  Future<void> getUnlockDevice(imei) async {
    log(">>>>>>>>>>>${imei.toString()}");
    var userId = await SharedToken().userId_read();
    BookingController bookingController = Get.find();
    bookingController.isLoading.value = true;
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('GET', Uri.parse('$baseUrl/api/v1/users/unlock/$userId'));
    request.body = json.encode({"imei": imei});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      HomeController homeController = Get.find();
      homeController.isUnlocked.value = true;
      Get.back();
      Get.snackbar(
        "Ride Started",
        "",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      bookingController.isLoading.value = false;
    } else {
      Get.back();
      Get.snackbar("Wrong Qr Code", "");
      bookingController.isLoading.value = false;
      print(response.reasonPhrase);
    }
  }
}
