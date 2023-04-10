import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:turbonmobility/app/api_services/api_client/api_client.dart';
import 'package:turbonmobility/app/controller/account_details_controller.dart';

import '../api_services/api_provider/payment_provider.dart';

class PaymentController extends GetxController {
  RxBool isLoading = false.obs;

  TextEditingController amountEditingController = TextEditingController();
  late Razorpay _razorpay;
  String orderId = "";
  RxDouble orderAmount = 0.0.obs;
  static const platform = MethodChannel("razorpay_flutter");
  Future<void> callCreateOrder(amount) async {
    Client client = Client();

    await PaymentProvider(client: client.init()).getAddPackage(amount);
  }

  Future<void> callAddMoneySecurityDeposit() async {
    Client client = Client();

    await PaymentProvider(client: client.init()).getAddSecurityDeposit();
  }

  Future<void> callAddMoneyToWallet(money) async {
    Client client = Client();

    await PaymentProvider(client: client.init()).addMoneyToWallet(money);
  }

  openPaymentGateWay(orderId, amount) {
    AccountDetailController accountDetailController =
        Get.put(AccountDetailController());
    var options = {
      'key': 'rzp_live_9ax99mRnmONcVk',
      'amount': amount,
      'name': "Turban Mobility",
      'description': 'Add Money to Turban Mobility Wallet',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'order_id': orderId.toString(),
      'prefill': {
        'contact':
            accountDetailController.currentAccountDetails["mobile"].toString(),
        'email': 'test@razorpay.com'
      }
    };
    try {
      _razorpay.open(options);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onReady();
  }

  @override
  void onClose() {
    orderId = '';
    _razorpay.clear();
    super.onClose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    callAddMoneyToWallet(orderAmount.value);

    // callAddMoneyToWallet(response.orderId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Helper().getCustomSnackbar(
    //     msg: "Payment Failed",
    //     subtitle: json.decode(response.message.toString())["error"]
    //         ["description"],
    //     color: Colors.redAccent);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Helper().getCustomSnackbar(
    //     msg: "", subtitle: response.toString(), color: Colors.redAccent);
  }
}
