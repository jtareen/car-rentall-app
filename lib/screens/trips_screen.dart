import 'package:flutter/material.dart';

class TripsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trips'),
      ),
      body: Center(
        child: Text(
          'Trips Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}