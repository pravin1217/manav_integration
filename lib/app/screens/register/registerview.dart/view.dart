import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/controller/login_controller.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/core/space_helper/spaces.dart';
import 'package:turbonmobility/app/core/typography/fontstyles.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
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
            initialChildSize: 0.7,
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
              child: SingleChildScrollView(
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.help_outline,
                            color: kcBlack,
                          ),
                          Text(
                            'Login issues?',
                            style: TextStyle(
                              color: kcPrimarySwatch,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 14,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'asset/c9.png',
                                width: 100,
                              ),
                              const Spacer(),
                              Image.asset(
                                'asset/logo.png',
                                height: 40,
                              ),
                            ],
                          ),
                          vSpaceRegular18,
                          const Text(
                            'Hey There,',
                            style: bodyStyle,
                          ),
                          vSpaceSmall10,
                          const Text(
                            'Get Ready to enjoy the finest public bike share system.',
                            style: captionStyle,
                          ),
                          vSpaceRegular18,
                        ],
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
                        child: TextFormField(
                          onChanged: (value) {
                            loginController.phone = value;
                          },
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          cursorColor: kcBlack,
                          style: const TextStyle(
                            color: kcBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: kcBlack,
                            ),
                            hintText: 'Enter your Mobile Number',
                            hintStyle: TextStyle(
                              color: kcBlack.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    vSpaceMedium25,
                    SizedBox(
                      width: screenWidth(context) * 0.4,
                      height: screenHeight(context) * 0.06,
                      child: ElevatedButton(
                          onPressed: () {
                            LoginController loginController =
                                Get.put(LoginController());
                            if (isCheck) {
                              print(loginController.phone.characters.length);
                              print(loginController.phone.characters);
                              if (loginController.phone.characters.length ==
                                  10) {
                                loginController.callLogin();
                              } else {
                                Get.snackbar(
                                  "Not Valid Number",
                                  "Please Enter Valid Number",
                                  colorText: Colors.white,
                                  backgroundColor: Colors.red,
                                );
                              }
                            } else {
                              Get.snackbar(
                                "Not Accept Terms & Conditions",
                                "Please Accept Terms & Conditions",
                                colorText: Colors.white,
                                margin: const EdgeInsets.all(10),
                                backgroundColor: Colors.red,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kcPrimary,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          child: Obx(
                            () => loginController.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  )
                                : const Text('Continue'),
                          )),
                    ),
                    vSpaceMedium25,
                    Row(
                      children: [
                        Checkbox(
                          value: isCheck,
                          onChanged: (value) {
                            setState(() {
                              isCheck = value!;
                            });
                          },
                          activeColor: kcPrimary,
                        ),
                        const Text(
                          'By continuing, you accept our T&C and Privacy Policy',
                          style: captionStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
