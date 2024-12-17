
import 'package:flutter/material.dart';

class SignInUpPageTextFieldModel {
  final String label;
  final String hint;
  final TextInputType inputType;
  final bool obscureText;
  final IconButton? iconButton;
  final TextEditingController? controller;

  const SignInUpPageTextFieldModel({
    required this.label,
    required this.hint,
    required this.inputType,
    this.iconButton,
    this.obscureText = false,
    this.controller
  });
}