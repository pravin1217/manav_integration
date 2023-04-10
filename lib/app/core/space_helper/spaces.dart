import 'package:flutter/material.dart';

// Horizontal Spacing
const Widget hSpaceSmall10 = SizedBox(width: 10.0);
const Widget hSpaceMin5 = SizedBox(width: 5.0);
const Widget hSpaceRegular18 = SizedBox(width: 18.0);
const Widget hSpaceMedium25 = SizedBox(width: 25.0);
const Widget hSpaceLarge50 = SizedBox(width: 50.0);

// Vertical Spacing
const Widget vSpaceMin5 = SizedBox(height: 5.0);
const Widget vSpaceSmall10 = SizedBox(height: 10.0);
const Widget vSpaceRegular18 = SizedBox(height: 18.0);
const Widget vSpaceMedium25 = SizedBox(height: 25.0);
const Widget vSpaceLarge50 = SizedBox(height: 50.0);

// Screen Size helpers

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;

//vertical divider
Widget kverticalDivider = Container(
  height: 30,
  width: 1,
  color: Colors.grey,
);
