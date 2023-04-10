import 'package:get/get.dart';
import 'package:turbonmobility/app/api_services/api_client/api_client.dart';

import '../api_services/api_provider/support_provider.dart';

class SupportController extends GetxController {
  var terms = "".obs;
  var isLoading = false.obs;
  var privacy = "".obs;

  Future<void> callTerms() async {
    isLoading.value = true;
    Client client = Client();
    await SupportProvider(client: client.init()).getTerms();
    await SupportProvider(client: client.init()).getPrivacyPolicy();
  }
}
