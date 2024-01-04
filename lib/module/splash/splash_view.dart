import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_widgets/common_widget.dart';
import '../login/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Get.to(() => const LoginView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: commonStructure(
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'), fit: BoxFit.cover
            ),
          ),
          // child: Center(
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width * 0.8,
          //     height: 100,
          //     child: Container(
          //       decoration: const BoxDecoration(
          //         image: DecorationImage(
          //             image: AssetImage('assets/images/core_logo.png'),
          //             fit: BoxFit.contain),
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
