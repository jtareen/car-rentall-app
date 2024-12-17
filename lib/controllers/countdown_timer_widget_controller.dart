import 'dart:async';
import 'package:get/get.dart';

class CountdownTimerController extends GetxController {
  var remainingTime = 30.obs; // Remaining time in seconds (default is 60)
  var timeUp = false.obs; // Time up state

  Timer? _timer;

  // Start the timer
  void startTimer(int duration) {
    remainingTime.value = duration;
    timeUp.value = false;

    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value = remainingTime.value-1;
      } else {
        _timer?.cancel();
        timeUp.value = true; // Set time up to true
      }
    });
  }

  // Restart the timer
  void restartTimer(int duration) {
    startTimer(duration);
  }

  @override
  void onClose() {
    _timer?.cancel(); // Clean up the timer
    super.onClose();
  }
}
