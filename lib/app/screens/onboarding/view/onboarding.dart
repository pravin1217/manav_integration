import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:turbonmobility/app/core/buttonstyle/buttonstyle.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/core/space_helper/spaces.dart';
import 'package:turbonmobility/app/core/typography/fontstyles.dart';
import 'package:turbonmobility/app/screens/onboarding/controller/onboardingcontroller.dart';
import 'package:turbonmobility/app/screens/onboarding/model/onboardingmodel.dart';

class OnbBoardingView extends StatelessWidget {
  const OnbBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<OnboardingController>();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller.pageController,
              itemCount: contents.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.asset(
                      contents[index].image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    DraggableScrollableSheet(
                      initialChildSize: 0.6,
                      minChildSize: 0.6,
                      builder: (context, scrollController) => Container(
                        decoration: const BoxDecoration(
                          color: kcWhite,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SingleChildScrollView(
                            child: Column(
                              //  crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                vSpaceSmall10,
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
                                Text(
                                  contents[index].title,
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.start,
                                  style: bodyStyle,
                                ),
                                vSpaceSmall10,
                                Text(
                                  contents[index].discription,
                                  style: captionStyle,
                                ),
                                vSpaceSmall10,
                                Image.asset(
                                  contents[index].gifimage,
                                  height: screenHeight(context) * 0.3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmoothPageIndicator(
                                      controller: controller.pageController,
                                      count: 4,
                                      effect: const ExpandingDotsEffect(
                                          dotHeight: 8,
                                          dotWidth: 8,
                                          activeDotColor: kcBlack),
                                    ),
                                    SizedBox(
                                      width: 127,
                                      height: 50,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            controller.forwardAction();

                                            controller;
                                          },
                                          style: elevatedButtonStyle,
                                          child: const FittedBox(
                                            child: Text(
                                              'Next',
                                              style: subheadingStyle,
                                            ),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    // vSpaceLarge50,
                    // Text(
                    //   contents[index].title,
                    //   textAlign: TextAlign.center,
                    //   style: heading1Style,
                    // ),
                    // vSpaceSmall10,
                    // Text(
                    //   contents[index].discription,
                    //   textAlign: TextAlign.center,
                    //   style: heading3Style,
                    // )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
