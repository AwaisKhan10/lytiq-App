// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/buttons/pressable_button.dart';
import 'package:lytiq/ui/screens/auth/sign_in/sign_In_screen.dart';
import 'package:lytiq/ui/screens/auth/welcome/resgiter_view_model.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ResgisterViewModel(),
      child: Consumer<ResgisterViewModel>(
        builder: (context, model, child) => Scaffold(
          body: Container(
            padding: EdgeInsets.all(40),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.signInBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset(AppAssets.appLogo)),
                30.verticalSpace,
                Wrap(
                  children: [
                    Text(
                      "Welcome to ",
                      style: style30Baloo,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Lytiq",
                      textAlign: TextAlign.center,
                      style: style30Baloo.copyWith(color: blueColor),
                    ),
                  ],
                ),
                5.verticalSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Push your limits and play with passion",
                        style: style16Baloo.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      10.verticalSpace,
                      PressableButton(
                        text: "Get Started",
                        onPressed: () {
                          Get.offAll(() => SignInScreen());
                        },
                      ),
                      40.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
