import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/offer_controller.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';
import 'package:velocity_x/velocity_x.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OfferController offerController = Get.put(OfferController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            "Offers",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Obx(
          () => offerController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(kcPrimary),
                  ),
                )
              : Column(
                  children: [
                    TabBar(
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      labelColor: Colors.red[700],
                      indicatorColor: Colors.red[700],
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(
                          text: "Coupons",
                        ),
                        Tab(
                          text: "Offers",
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Column(
                            children: [
                              10.heightBox,
                              Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: "Enter Coupon Code",
                                        filled: true,
                                        hintStyle:
                                            TextStyle(color: Colors.black38),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black12,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black12,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black12,
                                          ),
                                        ),
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  10.widthBox,
                                  "Add"
                                      .text
                                      .white
                                      .size(12)
                                      .make()
                                      .pSymmetric(h: 20, v: 6)
                                      .box
                                      .p4
                                      .withRounded(
                                        value: 18,
                                      )
                                      .gray400
                                      .make(),
                                ],
                              ),
                              100.heightBox,
                              "No Coupon Codes available at the moments"
                                  .text
                                  .make(),
                            ],
                          )
                              .box
                              .color(const Color.fromARGB(255, 248, 248, 248))
                              .make(),
                          Column(
                            children: [
                              ...offerController.offerList
                                  .map((e) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.network(e["image"])),
                                          5.heightBox,
                                          Text(
                                              "Description: ${e["desc"].toString()}"),
                                          5.heightBox,
                                        ],
                                      )
                                          .box
                                          .withRounded(
                                            value: 12,
                                          )
                                          .white
                                          .make()
                                          .p12())
                                  .toList(),
                            ],
                          )
                              .box
                              .color(const Color.fromARGB(255, 248, 248, 248))
                              .make(),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
