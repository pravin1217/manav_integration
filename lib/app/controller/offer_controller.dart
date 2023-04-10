import 'package:get/get.dart';
import 'package:turbonmobility/app/api_services/api_provider/offer_PROVIDER.dart';

import '../api_services/api_client/api_client.dart';

class OfferController extends GetxController {
  RxBool isLoading = false.obs;

  var offerList = [];
  var rideCharges = [];
  Future<void> callOfferList() async {
    Client client = Client();

    await OfferProvider(client: client.init()).getOfferList();
  }

  Future<void> callRideCharges() async {
    Client client = Client();

    await OfferProvider(client: client.init()).getRideCharges();
  }

  @override
  void onReady() {
    callRideCharges();
    callOfferList();

    super.onReady();
  }
}
