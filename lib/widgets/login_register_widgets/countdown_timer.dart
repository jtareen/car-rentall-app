import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int duration;
  final Widget timeUpWidget;

  const CountdownTimer({super.key, this.duration = 60, this.timeUpWidget = const Text('Time Up')});

  @override
  State<CountdownTimer> createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  int _remainingTime = 0; // Time in seconds (default 1 minute)
  bool _timeUp = false;
  Timer? _timer;

  void _startTimer(int duration) {
    _remainingTime = duration; // Set the duration
    _timeUp = false; // Set the time up to false
    _timer?.cancel(); // Cancel any previous timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel(); // Stop the timer when it reaches 0
          _timeUp = true; // Assign a message to show when time is up
        }
      });
    });
  }

  void restartTimer () {
    _startTimer(widget.duration);
  }

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration;
    _startTimer(_remainingTime);
  }

  @override
  void dispose() {
    _timer?.cancel(); // Clean up the timer when the widget is disposed
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _timeUp ? widget.timeUpWidget : Text(
              _formatTime(_remainingTime), // Display remaining time
              style: const TextStyle(fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.w500),
            ),
          ],
        ),
    );
  }
}
