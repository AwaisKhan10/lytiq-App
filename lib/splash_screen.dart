// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/ui/screens/auth/welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to next screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// Start Body
      ///
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.signInBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: Image.asset(AppAssets.appLogo)),
      ),
    );
  }
}
