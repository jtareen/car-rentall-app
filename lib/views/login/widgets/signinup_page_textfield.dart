import 'package:car_renr_app/constants/styles.dart';
import 'package:car_renr_app/models/signin_textfield_model.dart';
import 'package:flutter/material.dart';

class SignInUpPageTextField extends StatelessWidget {
  final SignInUpPageTextFieldModel model;

  const SignInUpPageTextField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(model.label, style: const TextStyle(color: primary, fontSize: 16, fontWeight: FontWeight.w600),),
          const SizedBox(height: 5,),
          TextField(
            controller: model.controller,
            obscureText: model.obscureText,
            autocorrect: false,
            enableSuggestions: false,
            decoration: InputDecoration(
                hintText: model.hint,
                suffixIcon: model.iconButton,
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
            keyboardType: model.inputType,
          )
        ]
    );
  }
}
