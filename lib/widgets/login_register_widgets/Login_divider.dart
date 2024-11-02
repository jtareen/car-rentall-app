import 'package:car_renr_app/utils/styles.dart';
import 'package:flutter/material.dart';

class LoginDivider extends StatelessWidget {
  final String label;

  const LoginDivider({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(
          thickness: 1,
          color: Colors.grey,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(label, style: const TextStyle(color: primary),),
        ),
        const Expanded(child: Divider(
          thickness: 1,
          color: Colors.grey,
        )),
      ],
    );
  }
}