import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';
import 'package:turbonmobility/app/controller/wallet_controller.dart';

import '../../controller/booking_controller.dart';
import '../../controller/payment_controller.dart';
import '../../sharedpreferences/shared_preferences.dart';

class PaymentProvider {
  Dio client;
  PaymentProvider({required this.client});

  Future<void> getAddPackage(amount) async {
    var userId = await SharedToken().userId_read();
    final PaymentController paymentController = Get.find();
    paymentController.orderAmount.value = double.parse(amount.toString());
    print(amount);
    Map body = {
      "userId": userId,
      "amount": "${amount}00".toString(),
    };
    try {
      paymentController.isLoading.value = true;
      Response response = await client.post(
        '/api/v1/payment/addmoney',
        data: json.encode(body),
      );
      log(">>>>>....${response.data.toString()}");
      if (response.statusCode == 200) {
        paymentController.orderId = response.data["details"]["payment_Id"];
        paymentController.openPaymentGateWay(
            response.data["details"]["payment_Id"], amount);

        paymentController.isLoading.value = false;
        //  Get.back();
        paymentController.amountEditingController.clear();
      } else {
        log(response.data.toString());
        paymentController.isLoading.value = false;
      }
    } on DioError catch (e) {
      log(e.toString());
      paymentController.isLoading.value = false;

      return Future.error(e.message);
    }
  }

  Future<void> getAddSecurityDeposit() async {
    var userId = await SharedToken().userId_read();
    final PaymentController paymentController = Get.find();
    final BookingController bookingController = Get.find();
    //final WalletController walletController = Get.find();
    Map body = {
      "amount": bookingController.securityAmount,
    };
    try {
      paymentController.isLoading.value = true;
      Response response = await client.post(
        '/api/v1/payment/deposit/$userId',
        data: json.encode(body),
      );

      if (response.statusCode == 200) {
        paymentController.orderId = response.data["details"]["payment_Id"];
        paymentController.openPaymentGateWay(
            response.data["details"]["payment_Id"], 500);
      } else {
        paymentController.isLoading.value = false;
      }
    } on DioError catch (e) {
      paymentController.isLoading.value = false;
      // Helper().getCustomSnackbar(
      //     msg: e.response!.data.toString(),
      //     subtitle: "",
      //     color: Colors.redAccent);

      return Future.error(e.message);
    }
  }

  Future<void> addMoneyToWallet(money) async {
    final PaymentController paymentController = Get.find();

    final WalletController walletController = Get.find();
    Map body = {
      "balance": money,
    };
    try {
      paymentController.isLoading.value = true;
      Response response = await client.post(
        '/api/v1/wallet/add',
        data: json.encode(body),
      );

      if (response.statusCode == 200) {
        walletController.callWalletBalance();
        Get.snackbar("Payment Successfully", "Money Added to Wallet",
            backgroundColor: Colors.green, colorText: Colors.white);
      } else {
        paymentController.isLoading.value = false;
      }
    } on DioError catch (e) {
      paymentController.isLoading.value = false;
      // Helper().getCustomSnackbar(
      //     msg: e.response!.data.toString(),
      //     subtitle: "",
      //     color: Colors.redAccent);

      return Future.error(e.message);
    }
  }
}
