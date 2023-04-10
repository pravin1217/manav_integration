import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/wallet_controller.dart';
import 'package:turbonmobility/app/core/space_helper/spaces.dart';
import 'package:turbonmobility/app/core/typography/fontstyles.dart';
import 'package:velocity_x/velocity_x.dart';

class AllTransactionview extends StatelessWidget {
  const AllTransactionview({super.key});

  @override
  Widget build(BuildContext context) {
    WalletController c = Get.put(WalletController());

    return SafeArea(
      child: Scaffold(
        //   backgroundColor: kcWhite,
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              vSpaceMedium25,
              Row(
                children: [
                  10.widthBox,
                  const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ).onTap(() {
                    Get.back();
                  }),
                  const Text(
                    '  All Transaction',
                    style: heading3Style,
                  ),
                ],
              ),
              Expanded(
                  child: Obx(
                () => c.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : c.allTransaction != []
                        ? "No Transaction Found".text.xl.makeCentered()
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: c.allTransaction.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                  title:
                                      Text(c.allTransaction[index]["invoice"]),
                                  // subtitle: Text(c.allTransaction[index]["invoice"]
                                  //     .toString()),
                                  trailing: Text(
                                    '₹${c.allTransaction[index]["amount"] / 100}',
                                    style: const TextStyle(color: Colors.green),
                                  ));
                            },
                          ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
