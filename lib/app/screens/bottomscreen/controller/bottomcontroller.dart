import 'package:flutter/cupertino.dart';

class BottomNavBarController extends ChangeNotifier{

    int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(index) {
    _currentIndex = index;
    notifyListeners();
  }
}