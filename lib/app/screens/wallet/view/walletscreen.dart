import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/payment_controller.dart';
import 'package:turbonmobility/app/controller/wallet_controller.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/core/space_helper/spaces.dart';
import 'package:turbonmobility/app/core/typography/fontstyles.dart';
import 'package:turbonmobility/app/routes/app_router.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';
import 'package:turbonmobility/app/screens/moreview/screens/profileview/view/saver_pack.dart';
import 'package:velocity_x/velocity_x.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentController paymentController = Get.put(PaymentController());
    WalletController walletController = Get.put(WalletController());
    return SafeArea(
      child: FutureBuilder(
          future: walletController.callAllApi(),
          builder: (context, snapshot) {
            return Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Obx(
                    () => walletController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                                backgroundColor: kcPrimary),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Turban Money',
                                style: heading3Style,
                              ),
                              vSpaceMedium25,
                              Stack(
                                alignment: Alignment.center,
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 185,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kcGrey),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '₹${walletController.balance.value}',
                                                style: heading1Style,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Refundable deposit ${!walletController.isSecurityDeposit.value ? "₹0.00" : "₹500.00"} ',
                                                    style: captionStyle,
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                    child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              walletController
                                                                      .isSecurityDeposit
                                                                      .value
                                                                  ? Colors.green
                                                                  : kcPrimary,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          walletController
                                                                  .isSecurityDeposit
                                                                  .value
                                                              ? 'Paid'
                                                              : 'Not paid',
                                                          style: smallfont9,
                                                        )),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          vSpaceSmall10,
                                          Row(
                                            children: const [
                                              Text(
                                                'Balance',
                                                style: bodyStyle18withgrey,
                                              ),
                                              hSpaceMin5,
                                              Icon(
                                                Icons.info_outline,
                                                color: kcGrey,
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '₹${walletController.balance.value} ',
                                                style: fonsize14,
                                              ),
                                              hSpaceSmall10,
                                              // Text(
                                              //   '₹0.00',
                                              //   style: fonsize14,
                                              // )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: const [
                                              Text(
                                                'Turban Money',
                                                style: fonsize14,
                                              ),
                                              hSpaceSmall10,
                                              // Text(
                                              //   'eCash',
                                              //   style: fonsize14,
                                              // )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    width: 250,
                                    bottom: -20,
                                    child: Container(
                                      height: 40,
                                      width: 250,
                                      decoration: const BoxDecoration(
                                        color: kcPrimary,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: const Center(
                                          child: Text(
                                        'Add Money',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      )),
                                    ).onTap(() {
                                      if (walletController
                                          .isSecurityDeposit.value) {
                                        Get.to(() => const SaverPacksScreen());
                                      } else {
                                        paymentController.callCreateOrder(299);
                                        Get.snackbar('Security Deposit',
                                            'Please pay security deposit first');
                                      }
                                    }),
                                  )
                                ],
                              ),
                              vSpaceLarge50,
                              vSpaceLarge50,
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: kcGrey),
                                ),
                                child: ListTile(
                                  onTap: () {
                                    MyRouter.pushNamed(MyRoutes.alltransaction);
                                  },
                                  leading: const Icon(
                                    Icons.compare_arrows_sharp,
                                    color: kcBlack,
                                  ),
                                  title: const Text(
                                    'All Transactions',
                                    style: fonsize16normal,
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: kcBlack,
                                  ),
                                ),
                              )
                            ],
                          ),
                  ),
                ));
          }),
    );
  }
}
