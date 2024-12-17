import 'package:car_renr_app/constants/styles.dart';
import 'package:flutter/material.dart';

class SignInUpPageButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const SignInUpPageButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          style: primaryTextButtonStyle,
          onPressed: onPressed,
          child: Text(label)
      ),
    );
  }
}