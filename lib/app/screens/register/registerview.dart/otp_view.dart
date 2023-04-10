import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:turbonmobility/app/controller/otp_controller.dart';

import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/core/space_helper/spaces.dart';
import 'package:turbonmobility/app/core/typography/fontstyles.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController otpController = Get.put(OtpController());
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'asset/registerpagemap.png',
            height: double.infinity,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            builder: (context, scrollController) => Container(
              padding: const EdgeInsets.only(
                top: 15,
                left: 20,
                right: 16,
              ),
              decoration: const BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: kcBlack,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 14,
                      right: 20,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Otp Verify,',
                            style: bodyStyle,
                          ),
                          vSpaceRegular18,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kcBlack.withOpacity(0.1),
                        ),
                        color: kcWhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: kcBlack.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: PinCodeTextField(
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: otpController.otp,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {},
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                  ),
                  vSpaceMedium25,
                  SizedBox(
                    width: screenWidth(context) * 0.4,
                    height: screenHeight(context) * 0.06,
                    child: ElevatedButton(
                        onPressed: () {
                          otpController.callOtp();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kcPrimary,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                        child: const Text('Verify Otp')),
                  ),
                  vSpaceMedium25,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
