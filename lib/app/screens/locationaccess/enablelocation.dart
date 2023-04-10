import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/location_controller.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/core/space_helper/spaces.dart';
import 'package:turbonmobility/app/core/typography/fontstyles.dart';
import 'package:turbonmobility/app/routes/app_router.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';

class EnableLocation extends StatelessWidget {
  const EnableLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              //  color: kcWhite,
              height: 450,
              width: double.infinity,
              child: Image.asset(
                'asset/startingpage.png',
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomCenter,
              ),
            ),
            vSpaceLarge50,
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                ' Allow Location Access',
                style: captionStyle,
                textAlign: TextAlign.center,
              ),
            ),
            vSpaceLarge50,
            SizedBox(
              width: 250,
              height: 60,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kcPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    LocationController locationController =
                        Get.put(LocationController());
                    locationController.getLocationRequest();
                    Future.delayed(const Duration(seconds: 2)).then((value) {
                      MyRouter.pushNamed(MyRoutes.onboarding);
                    });
                  },
                  child: const Text(
                    'Enable Location',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
