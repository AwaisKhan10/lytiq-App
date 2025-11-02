import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:lytiq/core/others/base_view_model.dart';

class SupportViewModel extends BaseViewModel {
  bool _isSpinning = false;
  Timer? _timer;

  Duration _currentTime = const Duration(hours: 24, minutes: 59, seconds: 59);


  bool get isSpinning => _isSpinning;
  Duration get currentTime => _currentTime;

  // wheel spinning and stopping
  void startSpin() {
    if (!_isSpinning) {
      _isSpinning = true;
      _currentTime = const Duration(hours: 24, minutes: 59, seconds: 59);
      _startTimer();
      notifyListeners();
      debugPrint('Spinning wheel started. Timer initiated.');
    }
  }

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
    _timer?.cancel();
    super.dispose();
  }
}
