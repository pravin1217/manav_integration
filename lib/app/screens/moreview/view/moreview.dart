import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turbonmobility/app/controller/account_details_controller.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/core/space_helper/spaces.dart';
import 'package:turbonmobility/app/core/typography/fontstyles.dart';
import 'package:turbonmobility/app/routes/app_router.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';
import 'package:turbonmobility/app/screens/moreview/controller/morecontroller.dart';
import 'package:turbonmobility/app/screens/moreview/screens/profileview/view/offers_screen.dart';
import 'package:turbonmobility/app/screens/moreview/screens/profileview/view/request_turban_zone.dart';
import 'package:turbonmobility/app/screens/moreview/screens/profileview/view/ride_charge.dart';
import 'package:turbonmobility/app/screens/moreview/screens/profileview/view/ride_history.dart';
import 'package:turbonmobility/app/screens/moreview/screens/profileview/view/saver_pack.dart';
import 'package:turbonmobility/app/screens/moreview/screens/profileview/view/turban_coin.dart';

import '../screens/profileview/view/setting_screen.dart';

class Morescreenview extends StatelessWidget {
  const Morescreenview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<MoreController>();
    AccountDetailController accountDetailController =
        Get.put(AccountDetailController());
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  MyRouter.pushNamed(MyRoutes.profileSection);
                },
                child: Container(
                  height: screenHeight(context) * 0.15,
                  width: screenWidth(context) * 3,
                  decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 60,
                              child: CircleAvatar(
                                child: Image.asset(
                                  'asset/onboarding/profileavatar.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Obx(
                              () => accountDetailController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      '${accountDetailController.currentAccountDetails["mobile"]}',
                                      style: subheadingStyle,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'asset/2location.png',
                                height: 18,
                                width: 22,
                              ),
                              hSpaceMin5,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${accountDetailController.currentAccountDetails["distance"]} km',
                                    style: fonsize14,
                                  ),
                                  Text(
                                    'Distance',
                                    style: fontsize11,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          kverticalDivider,
                          Row(
                            children: [
                              Image.asset(
                                'asset/onboarding/fire.png',
                                height: 18,
                                width: 22,
                              ),
                              hSpaceMin5,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${accountDetailController.currentAccountDetails["cal"]} cal',
                                    style: fonsize14,
                                  ),
                                  Text(
                                    'Calories',
                                    style: fontsize11,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          kverticalDivider,
                          Row(
                            children: [
                              Image.asset(
                                'asset/onboarding/cloud.png',
                                height: 18,
                                width: 22,
                              ),
                              hSpaceMin5,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${accountDetailController.currentAccountDetails["carbon"]} gms',
                                    style: fonsize14,
                                  ),
                                  Text(
                                    'Carbon',
                                    style: fontsize11,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            vSpaceMedium25,
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.moreOptionsTitles.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Material(
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                        switch (index) {
                          case 0:
                            MyRouter.push(screen: const SaverPacksScreen());

                            break;
                          case 1:
                            MyRouter.push(screen: const RideHistoryScreen());

                            break;
                          case 2:
                            MyRouter.push(screen: const TurbanCoinScreen());

                            break;
                          case 3:
                            MyRouter.push(screen: const OfferScreen());

                            break;
                          case 4:
                            MyRouter.push(screen: const RideChargesScreen());

                            break;
                          case 5:
                            MyRouter.push(screen: const SettingScreen());

                            break;
                          case 6:
                            MyRouter.push(screen: const RequestTurbanZone());

                            break;
                          default:
                        }
                      },
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        ),
                        side: BorderSide(
                          color: kcGrey,
                          width: 0.3,
                        ),
                      ),
                      leading: Image.asset(
                        controller.moreOptionsIcons[index],
                        height: 24,
                        width: 24,
                      ),
                      title: Text(
                        controller.moreOptionsTitles[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
