import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../api_services/api_client/api_client.dart';
import '../api_services/api_provider/account_details_provider.dart';

class AccountDetailController extends GetxController {
  var currentAccountDetails = {};
  var issecuritydeposit = false.obs;
  var amount = 0.0;
  RxString profileImage = "".obs;
  RxString randomCacheKey = "".obs;
  RxString username = "".obs;
  RxString useremail = "".obs;
  RxString useraadhar = "".obs;
  RxString usermobile = "".obs;



  Future<void> callUserDetails() async {
    Client client = Client();
    await AccountDetailModelProvider(client: client.init()).getAccountDetails();
  }
  Future<void> UpdateUser() async {
    Client client = Client();
    await AccountDetailModelProvider(client: client.init()).getAccountDetailsUpdate();
  }

  RxBool isLoading = false.obs;

  @override
  void onClose() {
    // isLoading = false as RxBool;
  }
  @override
  void onReady() {
    // TODO: implement onReady
    callUserDetails();
    super.onReady();

  }
}
