import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/screens/bottomscreen/controller/bottomcontroller.dart';
import 'package:turbonmobility/app/screens/moreview/view/moreview.dart';
import 'package:turbonmobility/app/screens/help/view/helperscreen.dart';
import 'package:turbonmobility/app/screens/home/view/homescreen.dart';
import 'package:turbonmobility/app/screens/wallet/view/walletscreen.dart';

import '../../../controller/location_controller.dart';
import '../../home/controller/home_controller.dart';

class BottomScreen extends StatelessWidget {
  BottomScreen({super.key});

  final pages = [
    const HomeScreen(),
    const WalletScreen(),
    const HelperScreen(),
    const Morescreenview(),
    // const AddPost(),
    // const JobsPage(),
    // const CreatePage(),
    // const AccountPage(),
    // const MessagePage()
  ];

  @override
  Widget build(BuildContext context) {
    LocationController locationController = Get.put(LocationController());
    HomeController homeController = Get.put(HomeController());
    final provider = Provider.of<BottomNavBarController>(context);
    return Scaffold(
        extendBody: true,
        body: GetBuilder<LocationController>(builder: (context) {
          return Stack(
            children: [
              GoogleMap(
                scrollGesturesEnabled: true,
                zoomControlsEnabled: true,
                myLocationEnabled: true,
                markers: locationController.bikeLocationMarker,
                myLocationButtonEnabled: true,
                compassEnabled: false,
                onTap: (argument) {},
                zoomGesturesEnabled: true,
                rotateGesturesEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition: locationController.googlePlex,
                onMapCreated: (GoogleMapController controller) {
                  if (!locationController.isCompleted.value) {
                    locationController.isCompleted.value = true;
                    locationController.mapController.complete(controller);
                    locationController.goCurrentLocation();
                  }
                },
              ),
              pages[provider.currentIndex],
            ],
          );
        }),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: kcBlack,

              // backgroundBlendMode: BlendMode.clear,
              // boxShadow: [],
            ),
            height: MediaQuery.of(context).size.height * 0.085,
            child: ClipRRect(
              child: BottomNavigationBar(
                  //  type: BottomNavigationBarType.fixed,
                  elevation: 5,
                  backgroundColor: kcWhite,
                  selectedItemColor: kcPrimary,
                  unselectedItemColor: kcWhite,
                  selectedFontSize: 25,
                  selectedIconTheme:
                      const IconThemeData(size: 34, color: kcPrimary),
                  selectedLabelStyle: const TextStyle(fontSize: 10),
                  unselectedLabelStyle: const TextStyle(color: kcBlack),
                  unselectedIconTheme:
                      const IconThemeData(size: 32, color: kcGrey),
                  currentIndex: provider.currentIndex,
                  onTap: (value) {
                    // postedjobspro.getAllJobs(context);
                    provider.currentIndex = value;
                    provider;
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home_rounded,
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.account_balance_wallet_sharp,
                        ),
                        label: ''),
                    // BottomNavigationBarItem(
                    //     icon: Icon(
                    //       Icons.add,
                    //     ),
                    //     label: 'Create'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.help,
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.more,
                        ),
                        label: ''),
                  ]),
            )));
  }
}
