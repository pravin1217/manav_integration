import 'package:get/state_manager.dart';
import 'package:turbonmobility/app/api_services/api_provider/booking_provider.dart';

import '../api_services/api_client/api_client.dart';

class BookingController extends GetxController {
  var bookingList = [];
  var allRideList = [];

  var securityAmount = 0.0;
  var allPackages = [];
  var isLoading = false.obs;
  var isBookingLoading = false.obs;
  callAllBooking() async {
    Client client = Client();
    BookingProvider(client: client.init()).getAllBookings();
  }

  callEndRide() async {
    Client client = Client();
    BookingProvider(client: client.init()).getEndRide("Near Station");
  }

  Future callRidesBooking() async {
    Client client = Client();
    BookingProvider(client: client.init()).getAllRide();
  }

  callPackagesAll() async {
    Client client = Client();
    BookingProvider(client: client.init()).getAllPackages();
  }

  callUnlockRide(key) async {
    Client client = Client();
    BookingProvider(client: client.init()).getUnlockDevice(key);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    callRidesBooking();
    callPackagesAll();
    callAllBooking();
  }
}
