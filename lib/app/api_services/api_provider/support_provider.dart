import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';

import '../../controller/support_controller.dart';

class SupportProvider {
  Dio client;
  SupportProvider({required this.client});

  Future<void> getTerms() async {
    final SupportController supportController = Get.find();

    try {
      supportController.isLoading.value = true;
      Response response = await client.get(
        '/api/v1/terms',
      );

      if (response.statusCode == 200) {
        supportController.terms.value = response.data["terms"]["terms"];
        supportController.isLoading.value = false;
      } else {
        supportController.isLoading.value = false;
      }
    } on DioError catch (e) {
      supportController.isLoading.value = false;

      return Future.error(e.message);
    }
  }

  Future<void> getPrivacyPolicy() async {
    final SupportController supportController = Get.find();

    try {
      supportController.isLoading.value = true;
      Response response = await client.get(
        '/api/v1/privacy',
      );

      if (response.statusCode == 200) {
        supportController.privacy.value = response.data["privacy"]["privacy"];
        supportController.isLoading.value = false;
      } else {
        supportController.isLoading.value = false;
      }
    } on DioError catch (e) {
      supportController.isLoading.value = false;

      return Future.error(e.message);
    }
  }
}
