import 'package:flutter/widgets.dart';

class HelpController extends ChangeNotifier {
  var helpRequest = [
    'refunding the security deposit',
    'The battery discharged completely during my ride',
    'Rate Card',
    'The vehicle not moving',
    'The ride started on the app but the Miracle is not responding',
  ];
  var allCategories = [
    'Ride and\nFare',
    'Account and\nTurban Mobility Money\nrelated',
    'report\nmisuse',
    'Reffering\nTurban Mobility to\nfriends',
    'Safety and\nsecurity',
    'Rentals',
    'Turban Mobility Coins'
  ];
}
