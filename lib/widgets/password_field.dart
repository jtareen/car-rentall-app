import 'package:car_renr_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:car_renr_app/widgets/signinup_page_textfield.dart';

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility () {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SignInUpPageTextField(
        label: 'Password',
        hint: 'Your password',
        inputType: TextInputType.visiblePassword,
        obscureText: _obscureText,
        iconButton: IconButton(
            onPressed: _togglePasswordVisibility,
            icon: Icon(
              _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              color: Colors.grey,
            )
        )
    );
  }
}