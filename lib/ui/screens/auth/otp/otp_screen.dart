// ignore_for_file: deprecated_member_use, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lytiq/core/contant/app_assets.dart';
import 'package:lytiq/core/contant/colors.dart';
import 'package:lytiq/core/contant/text_style.dart';
import 'package:lytiq/ui/custom_widget/buttons/pressable_button.dart';
import 'package:lytiq/ui/screens/auth/otp/otp_view_model.dart';
import 'package:lytiq/ui/screens/home/home_screen.dart';
import 'package:lytiq/ui/screens/root/root_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;

  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ForgotViewModel()..startTimer(),
      builder: (context, _) {
        final vm = context.watch<ForgotViewModel>();

        return Scaffold(
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
                          Text(
                            "Verify Your Number",
                            style: style30Baloo.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          10.verticalSpace,
                          Text(
                            "We’ve sent a 6-digit code to $phoneNumber",
                            textAlign: TextAlign.center,
                            style: style16Baloo.copyWith(color: Colors.white70),
                          ),
                          40.verticalSpace,

                          /// OTP Input
                          Pinput(
                            controller: vm.otpController,
                            length: 6,
                            defaultPinTheme: PinTheme(
                              width: 55.w,
                              height: 60.h,
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white54),
                              ),
                            ),
                            focusedPinTheme: PinTheme(
                              width: 55.w,
                              height: 60.h,
                              textStyle: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: blueColor,
                                  width: 1.8,
                                ),
                              ),
                            ),
                            onCompleted: (_) {},
                          ),

                          30.verticalSpace,

                          /// Verify Button
                          PressableButton(
                            text: "Verify & Continue",
                            onPressed: () => vm.verifyOtp(() {
                              Get.offAll(() => RootScreen());
                            }),
                          ),

                          20.verticalSpace,

                          /// Resend OTP Section
                          vm.isResendEnabled
                              ? GestureDetector(
                                  onTap: vm.resendCode,
                                  child: Text(
                                    "Resend Code",
                                    style: style16Baloo.copyWith(
                                      color: blueColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              : Text(
                                  "Resend in ${vm.secondsRemaining} sec",
                                  style: style16Baloo.copyWith(
                                    color: Colors.white70,
                                  ),
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
        );
      },
    );
  }
}
