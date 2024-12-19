

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../../constants/styles.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final Callback onPressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [primary800, primary700, primary600]),
            borderRadius: BorderRadius.circular(25)
        ),
        child: Icon(icon, size: 30, color: Colors.white),
      ),
    );
  }
}