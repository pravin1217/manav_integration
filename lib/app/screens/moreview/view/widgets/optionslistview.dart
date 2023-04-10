//more section listview

import 'package:flutter/material.dart';

Widget moreOptions(iconColor, IconData icon, name, context, onTaping) {
  var radius = MediaQuery.of(context).size.width * 0.04;

  return ListTile(
    leading:Icon(icon),
    title: Text(name),
    onTap: () {
      // Update the state of the app.
      // ...

      onTaping();
    },
  );
}