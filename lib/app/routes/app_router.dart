import 'package:turbonmobility/app/screens/bottomscreen/view/bottomscreen.dart';
import 'package:turbonmobility/app/screens/home/view/homescreen.dart';
import 'package:turbonmobility/app/screens/moreview/screens/profileview/view/profileview.dart';
import 'package:turbonmobility/app/screens/onboarding/view/onboarding.dart';
import 'package:turbonmobility/app/screens/register/registerview.dart/view.dart';
import 'package:turbonmobility/app/screens/splash_view/splash.dart';

import '../screens/wallet/screens/alltransaction/view.dart';

class MyRoutes {
  static final routes = {
    init: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
    onboarding: (context) => const OnbBoardingView(),
    register: (context) => const RegisterView(),
    bottom: (context) => BottomScreen(),
    alltransaction: (context) => const AllTransactionview(),
    profileSection: (context) =>  ProfileView(),
    // signup: (context) =>const SignupScreen(),
    // home: (context) =>const HomeScreen(),
  };

  static const init = '/';
  static const home = 'homeScreen';
  static const onboarding = 'onboardingScreen';
  static const register = 'registerScreen';
  static const bottom = 'bottomScreen';
  static const alltransaction = 'alltransaction';
  static const profileSection = 'profileSection';
}
