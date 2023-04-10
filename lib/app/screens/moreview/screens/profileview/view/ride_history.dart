import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/booking_controller.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';
import 'package:velocity_x/velocity_x.dart';

class RideHistoryScreen extends StatelessWidget {
  const RideHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BookingController bookingController = Get.put(BookingController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            MyRouter.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Ride History",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(
        () => bookingController.isBookingLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(kcPrimary),
                ),
              )
            : bookingController.bookingList.isNotEmpty
                ? ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) => Card(
                          elevation: 4,
                          child: ListTile(
                            title: bookingController.bookingList[index]
                                    ["location"]
                                .toString()
                                .text
                                .make(),
                            subtitle:
                                "Time: ${bookingController.bookingList[index]["booking"]["time"]} | Distance: ${bookingController.bookingList[index]["booking"]["distance"]}"
                                    .text
                                    .make(),
                          ),
                        ).pSymmetric(h: 10),
                    itemCount: bookingController.bookingList.length)
                : Image.asset(
                    "asset/no_ride.png",
                    fit: BoxFit.contain,
                  ),
      ),
    );
  }
}
