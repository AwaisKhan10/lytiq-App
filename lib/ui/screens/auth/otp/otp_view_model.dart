import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lytiq/core/others/base_view_model.dart';

class ForgotViewModel extends BaseViewModel {
  final TextEditingController otpController = TextEditingController();

  bool _isResendEnabled = false;
  int _secondsRemaining = 30;
  Timer? _timer;

  bool get isResendEnabled => _isResendEnabled;
  int get secondsRemaining => _secondsRemaining;

  void startTimer() {
    _isResendEnabled = false;
    _secondsRemaining = 30;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
        notifyListeners();
      } else {
        _isResendEnabled = true;
        timer.cancel();
        notifyListeners();
      }
    });
  }

  void resendCode() {
    startTimer();
    // TODO: Call resend OTP API here
  }

  void verifyOtp(VoidCallback onSuccess) {
    final otp = otpController.text.trim();
    if (otp.length == 6) {
      // TODO: verify OTP via API
      onSuccess();
    } else {
      // Show error via snackbar or similar
    }
  }

  @override
  void dispose() {
    otpController.dispose();
    _timer?.cancel();
    super.dispose();
  }
}
