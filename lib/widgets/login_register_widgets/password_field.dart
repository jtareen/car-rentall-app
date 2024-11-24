import 'package:car_renr_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_textfield.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final String hint;

  const PasswordField({super.key, this.label = 'Password', this.hint = 'Your password'});

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
        label: widget.label,
        hint: widget.hint,
        inputType: TextInputType.visiblePassword,
        obscureText: _obscureText,
        iconButton: IconButton(
            onPressed: _togglePasswordVisibility,
            icon: Image.asset(
              _obscureText ? 'assets/icons/visibility_icon.png' : 'assets/icons/visibility_off_icon.png',
              color: Colors.grey,
            )
        )
    );
  }
}