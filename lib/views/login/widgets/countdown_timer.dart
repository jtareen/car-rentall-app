import 'package:car_renr_app/controllers/widgets/countdown_timer_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountdownTimer extends StatelessWidget {
  final int duration; // Timer duration in seconds
  final Widget timeUpWidget;

  CountdownTimer({
    super.key,
    this.duration = 60,
    this.timeUpWidget = const Text('Time Up'),
  });

  final CountdownTimerController controller = Get.put(CountdownTimerController());

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    controller.startTimer(duration);

    return Center(
        child: Obx(() {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.timeUp.value ? timeUpWidget : Text(
                _formatTime(controller.remainingTime.value), // Display remaining time
                style: const TextStyle(fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.w500),
              ),
            ],
          );
        }
        )
    );
  }
}
