import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';
import 'package:turbonmobility/app/sharedpreferences/shared_preferences.dart';

import '../../controller/booking_controller.dart';
import '../../controller/wallet_controller.dart';

class WalletProvider {
  Dio client;
  WalletProvider({required this.client});
  Future<void> getSecurityAmount() async {
    BookingController bookingController = Get.put(BookingController());
    bookingController.isLoading.value = true;

    var userId = await SharedToken().userId_read();
    print(userId.toString());
    try {
      Response response = await client.get(
        '/api/v1/payment/deposit/$userId',
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        bookingController.securityAmount =
            double.parse(response.data["detais"]["amount"].toString());

        bookingController.isLoading.value = false;
      } else {
        bookingController.bookingList = [];
        bookingController.isLoading.value = false;
      }
    } on DioError {
      bookingController.isLoading.value = false;
    }
  }

  Future<void> getAllTransaction() async {
    WalletController bookingController = Get.put(WalletController());
    bookingController.isLoading.value = true;

    var userId = await SharedToken().userId_read();
    print(userId.toString());
    try {
      Response response = await client.get(
        '/api/v1/payment/user/$userId',
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        bookingController.allTransaction = response.data["data"];

        bookingController.isLoading.value = false;
      } else {
        bookingController.allTransaction = [];
        bookingController.isLoading.value = false;
      }
    } on DioError {
      bookingController.isLoading.value = false;
    }
  }

  Future<void> getUserWalletDetails() async {
    final WalletController walletController = Get.find();

    try {
      walletController.isLoading.value = true;
      Response response = await client.get(
        '/api/v1/wallet/getwallet',
      );
      log(response.data.toString());

      if (response.statusCode == 200) {
        walletController.balance.value = response.data["data"]["balance"];
        if (walletController.balance.value >= 500) {
          walletController.isSecurityDeposit.value = true;
        } else {
          walletController.isSecurityDeposit.value = false;
        }
        walletController.isLoading.value = false;
      } else {
        walletController.isLoading.value = false;
      }
    } on DioError catch (e) {
      walletController.isLoading.value = false;

      return Future.error(e.message);
    }
  }

  Future<void> getTurboPoints() async {
    final WalletController walletController = Get.find();
    var userId = await SharedToken().userId_read();
    try {
      walletController.isLoading.value = true;
      Response response = await client.get(
        '/api/v1/users/point/$userId',
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        walletController.turboPoint.value = response.data["message"]["point"];

        walletController.isLoading.value = false;
      } else {
        walletController.isLoading.value = false;
      }
    } on DioError catch (e) {
      walletController.isLoading.value = false;

      return Future.error(e.message);
    }
  }
}
