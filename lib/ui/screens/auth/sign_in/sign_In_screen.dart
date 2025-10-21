// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/buttons/pressable_button.dart';
import 'package:lytiq/ui/custom_widget/buttons/social_button.dart';
import 'package:lytiq/ui/screens/auth/otp/otp_screen.dart';
import 'package:lytiq/ui/screens/auth/sign_in/sign_In_view_model.dart';
import 'package:lytiq/ui/screens/home/home_screen.dart';
import 'package:lytiq/ui/screens/root/root_screen.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignInViewModel(),
      child: Consumer<SignInViewModel>(
        builder: (context, model, child) => Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.signInBg),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight:
                          MediaQuery.of(context).size.height -
                          MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Welcome to ", style: style30Baloo),
                              Text(
                                "Lytiq",
                                style: style30Baloo.copyWith(color: blueColor),
                              ),
                            ],
                          ),
                          5.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60.0,
                            ),
                            child: Text(
                              "Push your limits and play with passion",
                              textAlign: TextAlign.center,
                              style: style16Baloo.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          20.verticalSpace,

                          /// ✅ Phone number field
                          PhoneNumberField(
                            controller: model.phoneController,
                            selectedCountry: model.selectedCountry,
                            onCountrySelected: model.setSelectedCountry,
                          ),

                          20.verticalSpace,

                          /// ✅ Login / Signup Button with Validation
                          PressableButton(
                            text: "Login Or SignUp",
                            onPressed: () {
                              final phone = model.phoneController.text.trim();

                              // Basic validation
                              if (phone.isEmpty) {
                                Get.snackbar(
                                  "Error",
                                  "Please enter your phone number",
                                  backgroundColor: Colors.redAccent,
                                  colorText: Colors.white,
                                );
                              } else if (!RegExp(
                                r'^[0-9]{7,15}$',
                              ).hasMatch(phone)) {
                                Get.snackbar(
                                  "Invalid Number",
                                  "Please enter a valid phone number",
                                  backgroundColor: Colors.redAccent,
                                  colorText: Colors.white,
                                );
                              } else {
                                // ✅ Valid number, proceed to OTP screen
                                Get.to(
                                  () => OtpScreen(
                                    phoneNumber:
                                        "+${model.selectedCountry.phoneCode}$phone",
                                  ),
                                );
                              }
                            },
                          ),

                          15.verticalSpace,
                          Text(
                            "Or Login With",
                            textAlign: TextAlign.center,
                            style: style16Baloo.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          15.verticalSpace,
                          SocialPressableButton(
                            text: "Continue with Google",
                            onPressed: () {
                              Get.offAll(() => RootScreen());
                            },
                            iconPath: AppAssets.googleIcon,
                          ),
                          40.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  final Country selectedCountry;
  final ValueChanged<Country> onCountrySelected;

  const PhoneNumberField({
    Key? key,
    required this.controller,
    required this.selectedCountry,
    required this.onCountrySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.8), width: 1.4),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Row(
        children: [
          // Country Picker Section
          InkWell(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                countryListTheme: CountryListThemeData(
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(color: Colors.white),
                  inputDecoration: const InputDecoration(
                    hintText: "Search country",
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                  ),
                ),
                onSelect: (country) {
                  onCountrySelected(country);
                },
              );
            },
            child: Row(
              children: [
                Text(
                  "${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white70,
                  size: 20,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                hintText: "3467890543",
                hintStyle: TextStyle(color: Colors.white70),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
