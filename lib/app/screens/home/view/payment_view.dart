import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/screens/home/controller/home_controller.dart';
import 'package:turbonmobility/app/screens/home/view/qr_scanner.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      backgroundColor: kcPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcPrimary,
        automaticallyImplyLeading: false,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ).onTap(() {
          Get.back();
        }),
        title: "Payment Options".text.white.make(),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              16,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.heightBox,
              Row(
                children: [
                  "Amount to be paid"
                      .text
                      .size(18)
                      .color(const Color(0xff5D5D5D))
                      .make(),
                  const Spacer(),
                  "₹ 200.00".text.size(16).make()
                ],
              ),
              5.heightBox,
              Row(
                children: [
                  "Security Deposit"
                      .text
                      .size(18)
                      .color(const Color(0xff5D5D5D))
                      .make(),
                  const Spacer(),
                  " ₹ 499.00".text.size(16).make()
                ],
              ),
              5.heightBox,
              Row(
                children: [
                  "Total"
                      .text
                      .bold
                      .size(18)
                      .color(const Color(0xff5D5D5D))
                      .make(),
                  const Spacer(),
                  " ₹ 699.00".text.size(16).make()
                ],
              ),
              30.heightBox,
              "Suggested for you"
                  .text
                  .size(18)
                  .semiBold
                  .color(const Color(0xff5D5D5D))
                  .make(),
              20.heightBox,
              RadioListTile(
                value: true,
                groupValue: 1,
                onChanged: (value) {},
                subtitle: "Account No.  xxxx xxxx 2456".text.make(),
                title: Row(
                  children: [
                    "HDFC Bank UPI".text.make(),
                    const Spacer(),
                    Image.asset(
                      "asset/upi 1.png",
                      height: 30,
                    ),
                  ],
                ),
              ),
              10.heightBox,
              RadioListTile(
                value: true,
                groupValue: 1,
                onChanged: (value) {},
                subtitle: "sanket564@okaxis".text.make(),
                title: Row(
                  children: [
                    "Google Pay UPI".text.make(),
                    const Spacer(),
                    Image.asset(
                      "asset/upi 1.png",
                      height: 30,
                    ),
                  ],
                ),
              ),
              10.heightBox,
              RadioListTile(
                value: true,
                groupValue: 1,
                onChanged: (value) {},
                //subtitle: "husal56@gmail.com".text.make(),
                title: Row(
                  children: [
                    "Google Pay".text.make(),
                    const Spacer(),
                    Image.asset(
                      "asset/google.png",
                      height: 30,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kcPrimary,
                        fixedSize: const Size.fromWidth(300),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      20.heightBox,
                                      Image.asset(
                                        "asset/confirm 1.png",
                                        height: 80,
                                      ),
                                      20.heightBox,
                                      "Paid Successfully".text.make(),
                                    ],
                                  ),
                                ),
                              ));

                      homeController.isUnlocked.value = true;
                      Future.delayed(const Duration(seconds: 1)).then((value) {
                        Get.back();
                        Get.to(() => const QRViewExample());
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: "Proceed To Pay".text.size(18).white.make(),
                    )),
              ),
              20.heightBox
            ],
          ),
        ),
      ),
    );
  }
}
