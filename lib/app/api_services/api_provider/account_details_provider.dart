import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';
import 'package:turbonmobility/app/controller/wallet_controller.dart';

import '../../controller/account_details_controller.dart';
import '../../sharedpreferences/shared_preferences.dart';

class AccountDetailModelProvider {
  Dio client;
  AccountDetailModelProvider({required this.client});

  Future<void> getAccountDetails() async {
    final AccountDetailController accountDetailController =
        Get.put(AccountDetailController());
    var userId = await SharedToken().userId_read();
    // print(" user id -$userId");
    try {
      accountDetailController.isLoading.value = true;
      Response response = await client.get(
        '/api/v1/users/$userId',
      );

      if (response.statusCode == 200) {
        log("----user get"+response.data.toString());
        print("== ${response.data}");
        accountDetailController.currentAccountDetails =
            response.data["message"];
        accountDetailController.issecuritydeposit.value =
            response.data["message"]["securitydeposit"];
        accountDetailController.username.value = response.data["message"]["name"];
        accountDetailController.useremail.value = response.data["message"]["email"];
        accountDetailController.useraadhar.value = response.data["message"]["aadhaar"];
        accountDetailController.usermobile.value = response.data["message"]["mobile"];
        WalletController walletController = Get.put(WalletController());
        walletController.callWalletBalance();
        walletController.callWalletDeposit();
        accountDetailController.isLoading.value = false;
      } else {
        accountDetailController.isLoading.value = false;
      }
    } on DioError catch (e) {
      accountDetailController.isLoading.value = false;
      // log("dio error - ${e.response!.realUri} ${e.response!.statusCode}");
      return Future.error(e.message);
    }
  }

  getAccountDetailsUpdate() async {

    final AccountDetailController accountDetailController =
        Get.put(AccountDetailController());
    var userId = await SharedToken().userId_read();
    print(userId);
    log("start updation- '/api/v1/users/update/$userId'");
    FormData formData = FormData.fromMap({
      "name": "demo Patel",
      "email": "Node5@flyweis",
      "aadhaar": "ASDASDQDASDASD"
    });
    try {
      accountDetailController.isLoading.value = true;
      Response response = await client.post(
        '/api/v1/users/update/$userId', data: formData
      );

      if (response.statusCode == 200) {
        log("===update==${response.data}=");
        Get.snackbar("Profile Updated", "Update Profile Successfully");
        accountDetailController.isLoading.value = false;
      } else {
        log("===update==${response.data}=");
        accountDetailController.isLoading.value = false;
      }
    } on DioError catch (e) {
      accountDetailController.isLoading.value = false;
      log("dio error - ${e.response} ${e.response!.statusCode}");
      return Future.error(e.message);
    }
  }
}
