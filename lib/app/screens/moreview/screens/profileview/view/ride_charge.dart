import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/offer_controller.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';
import 'package:velocity_x/velocity_x.dart';

class RideChargesScreen extends StatefulWidget {
  const RideChargesScreen({super.key});

  @override
  State<RideChargesScreen> createState() => _RideChargesScreenState();
}

class _RideChargesScreenState extends State<RideChargesScreen> {
  @override
  Widget build(BuildContext context) {
    OfferController offerController = Get.put(OfferController());

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
          "Ride Charges",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(() => offerController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(kcPrimary),
              ),
            )
          : offerController.rideCharges == []
              ? Image.asset(
                  "asset/no_ride.png",
                ).centered()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: offerController.rideCharges.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      offerController.rideCharges[index]
                                          ["rideType"],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          offerController.rideCharges[index]
                                              ["distance"],
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        " km".text.make(),
                                        Spacer(),
                                        Text(
                                          offerController.rideCharges[index]
                                              ["time"],
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
    );
  }
}
