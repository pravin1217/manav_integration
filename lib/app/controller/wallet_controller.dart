import 'package:get/get.dart';

import '../api_services/api_client/api_client.dart';
import '../api_services/api_provider/wallet_provider.dart';

class WalletController extends GetxController {
  RxBool isLoading = false.obs;
  var balance = 0.obs;
  var turboPoint = 0.obs;
  var isSecurityDeposit = false.obs;
  var allTransaction = [];
  Future<void> callWalletBalance() async {
    Client client = Client();

    await WalletProvider(client: client.init()).getUserWalletDetails();
  }

  Future<void> callAllTransaction() async {
    Client client = Client();

    await WalletProvider(client: client.init()).getAllTransaction();
  }

  Future<void> callWalletDeposit() async {
    Client client = Client();

    await WalletProvider(client: client.init()).getSecurityAmount();
  }

  Future<void> callTurboPoint() async {
    Client client = Client();

    await WalletProvider(client: client.init()).getUserWalletDetails();
  }

  callAllApi() {
    callWalletDeposit();
    callWalletBalance();
    callTurboPoint();
  }

  @override
  void onReady() {
    Future.delayed(Duration(milliseconds: 200), () {
      callAllTransaction();
    });
    super.onReady();
  }
}
