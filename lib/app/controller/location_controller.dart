import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart' as geo;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:turbonmobility/app/controller/booking_controller.dart';

class LocationController extends GetxController {
  Set<Marker> bikeLocationMarker = {};
  late BitmapDescriptor sourceIcon;
  var isCompleted = false.obs;
  var address = "".obs;
  final Completer<GoogleMapController> mapController2 = Completer();
  final Completer<GoogleMapController> mapController = Completer();
  late CameraPosition googlePlex;
  var currentPosition = Position(
    altitude: 0,
    speed: 0,
    accuracy: 0,
    latitude: 0,
    longitude: 0,
    timestamp: DateTime.now(),
    speedAccuracy: 0,
    heading: 0,
  ).obs;

//get address form lat long
  // Future<String> getAddressFromLatLng(double lat, double lng) async {
  //   List<geo.Placemark> placemarks =
  //       await geo.placemarkFromCoordinates(lat, lng);
  //   geo.Placemark place = placemarks[0];
  //   address.value = "${place.locality}, ${place.postalCode}, ${place.country}";
  //   return "${place.locality}, ${place.postalCode}, ${place.country}";
  // }

  Future<Position> getLocationRequest() async {
    bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Location location = Location();
    LocationData locationData = await location.getLocation();

    Position temp = await Geolocator.getCurrentPosition();
    LocationController locationController = Get.put(LocationController());
    locationController.currentPosition.value = temp;
    //  getAddressFromLatLng(temp.latitude, temp.longitude);
    return temp;
  }

  Future<void> goCurrentLocation() async {
    await Geolocator.getCurrentPosition().then((loc) async {
      CameraPosition current = CameraPosition(
          target: LatLng(loc.latitude, loc.longitude),
          zoom: 16.501926040649414);
      final GoogleMapController controllers = await mapController.future;
      controllers.animateCamera(CameraUpdate.newCameraPosition(current));

      update();
    });
  }

  Future<void> goCurrentLocation2() async {
    await Geolocator.getCurrentPosition().then((loc) async {
      CameraPosition current = CameraPosition(
          target: LatLng(loc.latitude, loc.longitude),
          zoom: 16.501926040649414);
      final GoogleMapController controllers = await mapController2.future;
      controllers.animateCamera(CameraUpdate.newCameraPosition(current));
//get address form lat long
      // getAddressFromLatLng(loc.latitude, loc.longitude);

      update();
    });
  }

  goToBikeLocation(lat, long) async {
    CameraPosition current =
        CameraPosition(target: LatLng(lat, long), zoom: 16.501926040649414);
    final GoogleMapController controllers = await mapController.future;
    controllers.animateCamera(CameraUpdate.newCameraPosition(current));

    update();
  }

  getBikeMarker() async {
    BookingController bookingController = Get.put(BookingController());

    for (int i = 0; i < bookingController.allRideList.length; i++) {
      bikeLocationMarker.add(
        Marker(
          markerId:
              MarkerId(bookingController.allRideList[i]["_id"].toString()),
          onDrag: (value) async {},
          position: LatLng(
              double.parse(bookingController.allRideList[i]["lat"].toString()),
              double.parse(
                  bookingController.allRideList[i]["long"].toString())),
          icon: sourceIcon,
        ),
      );
    }
    update();
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(40, 40)),
      'asset/locationpoint.png',
    );
    getBikeMarker();
  }

  @override
  void onInit() async {
    googlePlex = CameraPosition(
      target: LatLng(
          currentPosition.value.latitude, currentPosition.value.longitude),
    );
    getLocationRequest();
    setSourceAndDestinationIcons();
    super.onInit();
  }
}
