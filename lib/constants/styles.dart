import 'package:flutter/material.dart';

const Color primary = Color.fromRGBO(19, 22, 52, 1.0);
const Color primary800 = Color(0xFF1B588C);
const Color primary700 = Color(0xff2b7bae);
const Color primary600 = Color(0xff3ea2d0);
const Color primary400 = Color(0xff7fe2f7);

final ButtonStyle primaryTextButtonStyle = TextButton.styleFrom(
    backgroundColor: primary,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
    )
);

final ButtonStyle secondaryTextButtonStyle = TextButton.styleFrom(
    padding: const EdgeInsets.all(20),
    foregroundColor: primary,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
    )
);