//--butttonStyles--

import 'package:flutter/material.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';

final elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor:kcPrimary,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  ),
);
