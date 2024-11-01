import 'package:flutter/material.dart';

const Color primary = Color.fromRGBO(19, 22, 52, 1.0);

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