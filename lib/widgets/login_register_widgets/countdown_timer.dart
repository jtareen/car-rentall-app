import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int duration;

  const CountdownTimer({super.key, this.duration = 60});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int _remainingTime = 0; // Time in seconds (default 1 minute)
  String? _timerMessage;
  Timer? _timer;

  void _startTimer(int duration) {
    _remainingTime = duration; // Set the duration
    _timerMessage = null; // Set message to null if countdown in start
    _timer?.cancel(); // Cancel any previous timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel(); // Stop the timer when it reaches 0
          _timerMessage = 'Time up!'; // Assign a message to show when time is up
        }
      });
    });
  }

  @override @override
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
            Text(
              _timerMessage ?? _formatTime(_remainingTime), // Display remaining time
              style: const TextStyle(fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.w500),
            ),
          ],
        ),
    );
  }
}
