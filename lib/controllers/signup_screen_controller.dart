

import 'package:car_renr_app/controllers/authentication_controller.dart';
import 'package:car_renr_app/controllers/toggle_message_box_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constants/message_box_type.dart';

class SignUpScreenController extends GetxController {
  static SignUpScreenController get instance => Get.find();

  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final toggleMessageBoxController = Get.put(ToggleMessageBoxController());

  bool validateInput() {
    if (fullName.text.trim().isEmpty ||
        email.text.trim().isEmpty ||
        password.text.trim().isEmpty) {

      toggleMessageBoxController.updateState(true, 'All fields required', AlertType.error, true);

      return false;
    }

    return true;
  }

  Future<void> registerUser () async {
    if (!validateInput()) return;

    try {
      final auth = AuthenticationController.instance;
      await auth.registerUser(
          email.text.trim(),
          password.text,
          fullName.text.trim()
      );
      auth.setInitialScreen(auth.firebaseUser.value);
    } catch (e) {
      toggleMessageBoxController.updateState(
          true,
          e.toString(),
          AlertType.error, true
      );
    }
  }


  @override
  void onClose() {
    email.dispose();
    password.dispose();
    fullName.dispose();
    super.onClose();
  }
}