
import 'package:car_renr_app/controllers/authentication_controller.dart';
import 'package:car_renr_app/controllers/toggle_message_box_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constants/message_box_type.dart';

class SignInScreenController extends GetxController {
  static SignInScreenController get instance => Get.find();

  late final TextEditingController email = TextEditingController();
  late final TextEditingController password = TextEditingController();
  final toggleMessageBoxController = Get.put(ToggleMessageBoxController());

  bool _validateInput() {
    if (email.text.trim().isEmpty ||
        password.text.trim().isEmpty) {
      toggleMessageBoxController.updateState(true, 'All fields are required.', AlertType.error, true);
      return false;
    }
    return true;
  }

  Future<void> loginAttempt () async {
    if (!_validateInput()) return;

    try {
      final auth = AuthenticationController.instance;
      await auth
          .loginUser(email.text.trim(), password.text);
      auth.setInitialScreen(auth.firebaseUser.value);
    } catch (e) {
      toggleMessageBoxController
          .updateState(
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
    super.onClose();
  }
}