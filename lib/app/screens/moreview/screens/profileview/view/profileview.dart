
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/account_details_controller.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/core/space_helper/spaces.dart';
import 'package:turbonmobility/app/core/typography/fontstyles.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileView extends StatefulWidget {
   ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  AccountDetailController accountDetailController =
  Get.find<AccountDetailController>();

  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController aadhar=TextEditingController();
  TextEditingController mobile=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
     name=TextEditingController(text: accountDetailController.username.value);
     email=TextEditingController(text: accountDetailController.useremail.value);
     aadhar=TextEditingController(text: accountDetailController.useraadhar.value);
     mobile=TextEditingController(text: accountDetailController.usermobile.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kcWhite,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: kcBlack,
          ).onTap(() {
            Get.back();
          }),
          title: const Text(
            'Profile',
            style: subheadingStyle,
          ),
        ),
        body:Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: screenHeight(context) * 0.15,
                  width: double.infinity,
                  color: kcPrimary,
                ),
                Positioned(
                  bottom: -80,
                  // left: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          color: kcPrimary,
                          border: Border.all(color: kcPrimary, width: 8),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Image(
                          image:
                              AssetImage('asset/onboarding/profileavatar.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: -80,
                    right: 120,
                    child: Image.asset('asset/camera.png')),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:  [
                  TextFormField(

                    decoration: InputDecoration(
                      hintText: 'Add Name',
                      hintStyle: fontsize20,
                      suffixIcon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: kcPrimary,
                      ),
                    ),
                    controller: name,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Enter Email ID',
                      hintStyle: fontsize20,
                      suffixIcon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: kcPrimary,
                      ),
                    ),
                  ),

                      TextFormField(
                        controller: aadhar,
                    decoration: InputDecoration(
                      hintText: 'Aadhaar Card Number',
                      hintStyle: fontsize20,
                      suffixIcon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: kcPrimary,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: mobile,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      label: Text('Mobile'),
                      labelStyle: TextStyle(
                        fontSize: 16,
                      ),
                      suffixIcon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: kcPrimary,
                      ),
                      hintStyle: fontsize20,
                    ),
                  ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     hintText: 'Set Password',
                  //     label: Text('Password'),
                  //     labelStyle: TextStyle(
                  //       color: kcPrimary,
                  //       fontSize: 16,
                  //     ),
                  //     hintStyle: fontsize20,
                  //     suffixIcon: Icon(
                  //       Icons.arrow_forward_ios_outlined,
                  //       color: kcPrimary,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kcPrimary,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                AccountDetailController accountDetailController =
                    Get.find<AccountDetailController>();
                // accountDetailController.UpdateUser();
                accountDetailController.callUserDetails();
                // Get.back();
                Get.snackbar(
                  "Profile Updated",
                  " Profile Updated Successfully",
                  backgroundColor: kcPrimary,
                  margin: const EdgeInsets.all(20),
                  colorText: kcWhite,
                );
              },
              child: const Text('Save'),
            ).pSymmetric(
              h: 20,
            ),
          ],
        ),
      ),
    );
  }
}
