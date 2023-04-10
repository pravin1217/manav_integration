import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:turbonmobility/app/core/space_helper/spaces.dart';
import 'package:turbonmobility/app/core/typography/fontstyles.dart';
import 'package:turbonmobility/app/screens/help/controller/helpcontroller.dart';
import 'package:velocity_x/velocity_x.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HelpController>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  'Help & Support',
                  style: heading3Style,
                ),
              ),
              vSpaceMedium25,
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  'Recommended help',
                  style: bodyStyle,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.helpRequest.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Get.snackbar("Request Submitted",
                              "Thank you for your request");
                        },
                        title: Text(
                          controller.helpRequest[index],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
              vSpaceMedium25,
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  'All categories',
                  style: bodyStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 2,
                  ),
                  itemCount: controller.allCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 219, 218, 218),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Text(controller.allCategories[index],
                            textAlign: TextAlign.start),
                      ),
                    ).onTap(() {
                      Get.snackbar(
                          "Request Submitted", "Thank you for your request");
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
