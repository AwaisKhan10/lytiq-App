import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:lytiq/core/others/base_view_model.dart';

class SupportViewModel extends BaseViewModel {
  bool _isSpinning = false;
  Timer? _timer;

  // Initial time set to 59 minutes and 59 seconds for demonstration (matches the UI display)
  // You can set this to a full 24 hours (Duration(hours: 24)) if needed.
  Duration _currentTime = const Duration(minutes: 59, seconds: 59);

  // --- Public Getters ---
  bool get isSpinning => _isSpinning;
  Duration get currentTime => _currentTime;

  // --- Timer Control ---

  /// Starts the wheel's circulation and initiates the countdown.
  void startSpin() {
    if (!_isSpinning) {
      _isSpinning = true;
      _currentTime = const Duration(
        minutes: 59,
        seconds: 59,
      ); // Reset/Start countdown
      _startTimer();
      notifyListeners();
      debugPrint('Spinning wheel started. Timer initiated.');
    }
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
}
