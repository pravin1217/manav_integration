import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turbonmobility/app/controller/location_controller.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';
import 'package:turbonmobility/app/screens/moreview/screens/profileview/view/request_zone_from.dart';
import 'package:velocity_x/velocity_x.dart';

class RequestTurbanZone extends StatelessWidget {
  const RequestTurbanZone({super.key});

  @override
  Widget build(BuildContext context) {
    LocationController locationController = Get.put(LocationController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
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
          "Request Zone",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Please select the zone you want to request for turban."
              .text
              .red500
              .size(16)
              .bold
              .make()
              .pSymmetric(h: 16, v: 16),
          Expanded(
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                locationController.mapController2.complete(controller);
                locationController.goCurrentLocation2();
              },
              initialCameraPosition:
                  CameraPosition(target: LatLng(19.0760, 72.8777), zoom: 10),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff292D38),
        onPressed: () {
          ;
          locationController.goCurrentLocation2();
        },
        child: const Icon(Icons.location_searching_rounded),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            "Next"
                .text
                .white
                .size(16)
                .bold
                .make()
                .pSymmetric(v: 12, h: 35)
                .box
                .withRounded(value: 22)
                .red500
                .make()
                .onTap(() {
              Get.to(() => const RequestTurbanFormZone());
            }),
            5.heightBox,
            Row(
              children: [
                Flexible(
                  child: "".text.bold.size(16).make(),
                ),
                10.widthBox,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
