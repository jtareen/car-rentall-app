import 'package:car_renr_app/utils/styles.dart';
import 'package:flutter/material.dart';

class SignInUpPageTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType inputType;
  bool obscureText;
  IconButton? iconButton;

  SignInUpPageTextField({super.key, required this.label, required this.hint, required this.inputType, this.iconButton, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: primary, fontSize: 16, fontWeight: FontWeight.w600),),
          const SizedBox(height: 5,),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
                hintText: hint,
                suffixIcon: iconButton,
                hintStyle: const TextStyle(
                    color: Colors.grey
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.grey)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: primary)
                )
            ),
            keyboardType: inputType,
          )
        ]
    );
  }
}
