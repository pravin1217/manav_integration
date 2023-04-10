import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/booking_controller.dart';
import 'package:turbonmobility/app/controller/payment_controller.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';
import 'package:velocity_x/velocity_x.dart';

class SaverPacksScreen extends StatelessWidget {
  const SaverPacksScreen({super.key});

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
          "Saver Pack",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Obx(
        () => bookingController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(kcPrimary),
                ),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   physics: const BouncingScrollPhysics(),
                    //   child: Row(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Image.asset(
                    //           "asset/banner2.png",
                    //           width: MediaQuery.of(context).size.width,
                    //           fit: BoxFit.fitWidth,
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Image.asset(
                    //           "asset/banner.png",
                    //           width: MediaQuery.of(context).size.width,
                    //           fit: BoxFit.fitWidth,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // 10.heightBox,
                    // "View other packs".text.bold.xl2.make().pSymmetric(
                    //       h: 12,
                    //     ),
                    ...bookingController.allPackages
                        .map(
                          (e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${e["packname"]}"
                                  .text
                                  .size(16)
                                  .black
                                  .bold
                                  .make(),
                              10.heightBox,
                              "${e["desc"]}".text.black.make(),
                              10.heightBox,
                              Row(
                                children: [
                                  "Time: ${e["time"]}".text.black.make(),
                                  10.widthBox,
                                  "Amount: ${e["amoumt"]}".text.black.make(),
                                ],
                              ),
                              10.heightBox,
                              Row(
                                children: [
                                  "Validity: ${e["validity"]}"
                                      .text
                                      .black
                                      .make(),
                                  const Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ],
                              ),
                              10.heightBox,
                            ],
                          )
                              .p8()
                              .box
                              .withRounded(
                                value: 8,
                              )
                              .border(
                                color: Colors.black45,
                              )
                              .make()
                              .p8()
                              .onTap(() {
                            PaymentController paymentController =
                                Get.put(PaymentController());
                            paymentController
                                .callCreateOrder(e["amoumt"].toString());
                          }),
                        )
                        .toList()
                  ],
                ),
              ),
      ),
    );
  }
}
