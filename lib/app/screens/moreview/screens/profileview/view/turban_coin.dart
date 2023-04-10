import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/wallet_controller.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';
import 'package:velocity_x/velocity_x.dart';

class TurbanCoinScreen extends StatelessWidget {
  const TurbanCoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WalletController walletController = Get.put(WalletController());
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
          "Turban Coin",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "asset/turbanCoin.png",
                height: 70,
              ),
              10.widthBox,
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "${walletController.turboPoint.value}"
                        .text
                        .bold
                        .white
                        .xl6
                        .make(),
                    "Turban Coin\nBalance".text.bold.white.size(22).make(),
                  ],
                ),
              ),
            ],
          ).p20().box.p8.red500.withRounded(value: 26).make(),
          10.heightBox,
          "1 Turban Coin = 50 Paise".text.bold.size(22).make(),
          10.heightBox,
          Image.asset("asset/redeem.png"),
          Image.asset("asset/turbanArt.png"),
        ],
      ).pSymmetric(h: 20, v: 20),
    );
  }
}
