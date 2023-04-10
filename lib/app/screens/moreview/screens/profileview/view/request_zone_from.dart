import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turbonmobility/app/core/colors/appcolors.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';
import 'package:velocity_x/velocity_x.dart';

class RequestTurbanFormZone extends StatelessWidget {
  const RequestTurbanFormZone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            MyRouter.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Request Zone",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                  labelText: "Enter Landmark"),
            ),
            10.heightBox,
            TextFormField(
              decoration: const InputDecoration(labelText: "Enter Commit"),
            ),
            20.heightBox,
            "Select Zone Type".text.size(16).bold.gray400.make(),
            20.heightBox,
            DropdownButton(
                value: 'Organization',
                isExpanded: true,
                items: <String>[
                  'Organization',
                  'Personal',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {}),
            20.heightBox,
            CheckboxListTile(
              value: true,
              onChanged: (value) {},
              title: "Can you help us setup this Turban Mobility Zone?"
                  .text
                  .make(),
            ),
            const Spacer(),
            "Submit"
                .text
                .white
                .bold
                .make()
                .pSymmetric(h: 40, v: 15)
                .box
                .withRounded(
                  value: 12,
                )
                .color(kcPrimary)
                .makeCentered()
                .onTap(() {
              Get.back();
              Get.back();
              Get.snackbar(
                "Zone Request",
                "Your request has been submitted",
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            }),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
