import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turbonmobility/app/routes/app_router.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';
import 'package:turbonmobility/app/screens/bottomscreen/controller/bottomcontroller.dart';
import 'package:turbonmobility/app/screens/help/controller/helpcontroller.dart';
import 'package:turbonmobility/app/screens/moreview/controller/morecontroller.dart';
import 'package:turbonmobility/app/screens/wallet/screens/alltransaction/controller/alltransactioncontroller.dart';

import 'app/screens/onboarding/controller/onboardingcontroller.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => OnboardingController()),
      ChangeNotifierProvider(create: ((context) => BottomNavBarController())),
      ChangeNotifierProvider(create: ((context) => AllTransController())),
      ChangeNotifierProvider(create: ((context) => HelpController())),
      ChangeNotifierProvider(create: ((context) => MoreController()))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Turban Mobility',
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.init,
      routes: MyRoutes.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: MyRouter.navigatorKey,
    );
  }
}
