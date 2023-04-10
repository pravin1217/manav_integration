import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';
import 'package:turbonmobility/app/controller/offer_controller.dart';

class OfferProvider {
  Dio client;
  OfferProvider({required this.client});

  Future<void> getOfferList() async {
    final OfferController offerController = Get.find();

    try {
      offerController.isLoading.value = true;
      Response response = await client.get(
        '/api/v1/offer',
      );

      if (response.statusCode == 200) {
        offerController.offerList = response.data["offer"];

        offerController.isLoading.value = false;
      } else {
        offerController.isLoading.value = false;
      }
    } on DioError catch (e) {
      offerController.isLoading.value = false;

      return Future.error(e.message);
    }
  }

  Future<void> getRideCharges() async {
    final OfferController offerController = Get.find();
    print("assas");
    try {
      offerController.isLoading.value = true;
      Response response = await client.get(
        '/api/v1/ride/all',
      );
      print(response.data["message"]);
      if (response.statusCode == 200) {
        offerController.rideCharges = response.data["message"];

        offerController.isLoading.value = false;
      } else {
        offerController.isLoading.value = false;
      }
    } on DioError catch (e) {
      offerController.isLoading.value = false;

      return Future.error(e.message);
    }
  }
}
