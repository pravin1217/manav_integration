import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';
import 'package:turbonmobility/app/screens/moreview/screens/profileview/view/privacy_screen.dart';
import 'package:turbonmobility/app/screens/moreview/screens/profileview/view/terms_screen.dart';
import 'package:turbonmobility/app/sharedpreferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../register/registerview.dart/view.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Choose Language".text.bold.size(16).make(),
          // 40.heightBox,
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     "Call Notification".text.bold.size(16).make(),
          //     const Spacer(),
          //     SizedBox(
          //       height: 10,
          //       width: 50,
          //       child: Switch(
          //         value: true,
          //         onChanged: (v) {},
          //       ),
          //     )
          //   ],
          // ),
          // 40.heightBox,
          // "Choose Language".text.bold.size(16).make(),
          // 40.heightBox,
          "Terms and Conditions".text.bold.size(16).make().onTap(() {
            Get.to(() => const TermScreen());
          }),
          40.heightBox,
          "Privacy Policy".text.bold.size(16).make().onTap(() {
            Get.to(() => const PrivacyScreen());
          }),
          40.heightBox,
          Row(
            children: [
              "Version".text.bold.size(16).make(),
              const Spacer(),
              "Version 1.0.0".text.gray500.size(16).make(),
            ],
          ),
          // 40.heightBox,
          // "Delete Account".text.bold.size(16).make(),
          40.heightBox,
          "Log out".text.bold.red600.size(16).make().onTap(() {
            SharedToken().clear_token();
            Get.deleteAll();
            Get.offAll(() => const RegisterView());
            //   Restart.restartApp();
          }),
        ],
      ).pSymmetric(h: 20, v: 20),
    );
  }
}
