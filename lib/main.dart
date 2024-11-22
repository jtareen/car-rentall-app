import 'package:car_renr_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
// import 'package:car_renr_app/screens/home_screen.dart';
// import 'package:car_renr_app/screens/onboarding_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: MainScreen()
    );
  }
}
