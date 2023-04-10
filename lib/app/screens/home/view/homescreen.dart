import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/account_details_controller.dart';
import 'package:turbonmobility/app/controller/booking_controller.dart';
import 'package:turbonmobility/app/controller/location_controller.dart';
import 'package:turbonmobility/app/controller/payment_controller.dart';
import 'package:turbonmobility/app/controller/wallet_controller.dart';
import 'package:turbonmobility/app/core/buttonstyle/buttonstyle.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/core/space_helper/spaces.dart';
import 'package:turbonmobility/app/core/typography/fontstyles.dart';
import 'package:turbonmobility/app/screens/home/controller/home_controller.dart';
import 'package:turbonmobility/app/screens/home/view/qr_scanner.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../moreview/screens/profileview/view/saver_pack.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WalletController walletController = Get.put(WalletController());
    PaymentController paymentController = Get.put(PaymentController());
    AccountDetailController accountDetailController =
        Get.put(AccountDetailController());
    BookingController bookingController = Get.put(BookingController());
    HomeController homeController = Get.put(HomeController());
    return DraggableScrollableSheet(
        initialChildSize: 0.4,
        // minChildSize: 0.05,
        // maxChildSize: 0.5,
        builder: (BuildContext context, ScrollController scrollController) =>
            Obx(() => bookingController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(kcPrimary),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                      color: kcWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          homeController.isUnlocked.value == true
                              ? const SizedBox()
                              : const Icon(
                                  Icons.keyboard_arrow_up,
                                  size: 50,
                                ),

                          homeController.isUnlocked.value == true
                              ? Image.asset(
                                  "asset/20d8733b97d44108a7c4cc40564dff71 1.png",
                                  height: 140,
                                )
                              : LimitedBox(
                                  maxWidth: screenWidth(context) * 0.5,
                                  maxHeight: 100,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        bookingController.allRideList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return LimitedBox(
                                        maxWidth: screenWidth(context) * 0.95,
                                        maxHeight: screenHeight(context) * 0.5,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0,
                                          ),
                                          child: Card(
                                            shadowColor: kcGrey,
                                            elevation: 5,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ListTile(
                                                    // minLeadingWidth: 12,
                                                    //horizontalTitleGap: 12,
                                                    leading: Column(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: kcCustompink,
                                                          ),
                                                          height: 55,
                                                          width: 50,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(6.0),
                                                            child: Image.asset(
                                                                'asset/locationpoint.png'),
                                                          ),
                                                        ),
                                                        //   vSpaceMin5,
                                                      ],
                                                    ),
                                                    title: Text(
                                                      bookingController
                                                          .allRideList[index]
                                                              ["location"]
                                                          .toString(),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        color: kcBlack,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    trailing: Container(
                                                      height: 60,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: kcCustompink,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 6.0,
                                                                vertical: 6.0),
                                                        child: Column(
                                                          children: [
                                                            Image.asset(
                                                              'asset/derectionicon.png',
                                                              height: 24,
                                                            ),
                                                            Text(
                                                              '${bookingController.allRideList[index]["distance"]} Km',
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style:
                                                                  captionStyle,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 20.0,
                                                    ),
                                                    child: Text(
                                                      '${bookingController.allRideList[index]["bikes"]} bikes',
                                                      style: captionStyle,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ).onTap(() {
                                        // log("=====${bookingController
                                        //     .allRideList[index]}");
                                        print(bookingController.allRideList
                                            .toString());
                                        LocationController locationController =
                                            Get.find();
                                        locationController.goToBikeLocation(
                                            double.parse(bookingController
                                                .allRideList[index]["lat"]
                                                .toString()),
                                            double.parse(bookingController
                                                .allRideList[index]["long"]
                                                .toString()));
                                      });
                                    },
                                  ),
                                ),
                          homeController.isUnlocked.value == true
                              ? "End Your Ride".text.xl.bold.make()
                              : const SizedBox(),
                          vSpaceMedium25,
                          SizedBox(
                            width: 130,
                            height: 45,
                            child: homeController.isUnlocked.value == true
                                ? ElevatedButton(
                                    style: elevatedButtonStyle,
                                    onPressed: () {
                                      BookingController bookingController =
                                          Get.put(BookingController());
                                      bookingController.callEndRide();
                                      showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      20.heightBox,
                                                      Image.asset(
                                                        "asset/391906020_THUMBS_UP_400px 1.png",
                                                        height: 140,
                                                      ),
                                                      20.heightBox,
                                                      "Thanks to drop the Bike at Charging Station."
                                                          .text
                                                          .xl
                                                          .bold
                                                          .make(),
                                                    ],
                                                  ),
                                                ),
                                              ));
                                      homeController.isUnlocked.value = false;
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.qr_code_2),
                                        Text('End Ride ')
                                      ],
                                    ))
                                : ElevatedButton(
                                    style: elevatedButtonStyle,
                                    onPressed: () {
                                      print(walletController.balance.value);

                                      if (!accountDetailController
                                          .issecuritydeposit.value) {
                                        paymentController.callCreateOrder(299);
                                      } else {
                                        if (walletController.balance.value >
                                            298) {
                                          Get.to(() => const QRViewExample());
                                        } else {
                                          Get.to(
                                              () => const SaverPacksScreen());
                                        }
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.qr_code_2),
                                        Text(' Unlock')
                                      ],
                                    )),
                          ),

                          //  Expanded(flex: 1, child: SizedBox())
                        ],
                      ),
                    ))));
  }
}
