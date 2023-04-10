import 'package:flutter/widgets.dart';
import 'package:turbonmobility/app/routes/app_router.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';

class OnboardingController extends ChangeNotifier {
  var selectedpageIndex = 0;

  final PageController pageController = PageController(initialPage: 0);
  // bool  lastpage => selectedpageIndex == contents[3];

  forwardAction() {
    if (selectedpageIndex == 0) {
   //   print('hdsufhsduhudshuisd');
      //go to Home
      MyRouter.pushNamed(MyRoutes.register);
    } else {
    //  print('object');
      pageController.nextPage(
          duration: const Duration(microseconds: 300), curve: Curves.ease);
    }
    notifyListeners();
  }
}
