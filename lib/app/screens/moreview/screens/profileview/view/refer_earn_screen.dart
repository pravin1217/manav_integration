import 'package:flutter/material.dart';
import 'package:turbonmobility/app/routes/app_routes.dart';

class ReferAndEarnScreen extends StatelessWidget {
  const ReferAndEarnScreen({super.key});

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
          "Refer & Earn",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Image.asset(
        "asset/refers.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
