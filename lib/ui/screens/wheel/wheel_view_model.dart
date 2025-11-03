import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lytiq/core/others/base_view_model.dart';

class WheelViewModel extends BaseViewModel {
  WheelViewModel._internal();
  static final WheelViewModel instance = WheelViewModel._internal();
  factory WheelViewModel() => instance;
  bool _isSpinning = false;
  Timer? _timer;
  Duration _currentTime = const Duration(minutes: 59, seconds: 59);
  bool get isSpinning => _isSpinning;
  Duration get currentTime => _currentTime;

  void startSpin() {
    if (_isSpinning) return;

    _isSpinning = true;
    _currentTime = const Duration(hours: 24); // Start from exactly 24 hours
    notifyListeners();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentTime.inSeconds > 0) {
        _currentTime = _currentTime - const Duration(seconds: 1);
        notifyListeners();
      } else {
        _timer?.cancel();
        _isSpinning = false;
        notifyListeners();
        // When timer reaches 0, "Collect Profit" will appear again
      }
    });
  }

  /// Stops the wheel's circulation and pauses the countdown.
  void stopSpin() {
    if (_isSpinning) {
      _isSpinning = false;
      _timer?.cancel();
      notifyListeners();
      debugPrint('Spinning wheel stopped. Timer paused.');
      // Add logic here for "collect profit" action if needed.
    }
  }

  void _startTimer() {
    // Cancel any existing timer to ensure only one is active
    _timer?.cancel();

    // Timer fires every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentTime.inSeconds > 0) {
        _currentTime = _currentTime - const Duration(seconds: 1);
        notifyListeners(); // Update the UI every second
      } else {
        // Timer reached 00:00:00
        _timer?.cancel();
        _isSpinning = false; // Stop the spin when time is up
        notifyListeners();
        debugPrint('Countdown finished.');
      }
    });
  }

  @override
  void dispose() {
    _timer
        ?.cancel(); // Ensure the timer is canceled when the ViewModel is disposed
    super.dispose();
  }

  ///
  ///. when user want to go back from wheel screen so user will go back to root screen but to index 3
  ///
  // --- Public Setter for selected wheel text ---
  String _selectedWheelText = 'Life time daily return 0.18';
  String get selectedWheelText => _selectedWheelText;
  void setSelectedWheelText(String text) {
    _selectedWheelText = text;
    notifyListeners();
  }
}
