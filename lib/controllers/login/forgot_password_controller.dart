
import 'package:car_renr_app/controllers/authentication/authentication_controller.dart';
import 'package:car_renr_app/controllers/widgets/toggle_message_box_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/message_box_type.dart';

class ForgotPasswordScreenController extends GetxController {
  static ForgotPasswordScreenController get instance => Get.find();

  final TextEditingController email = TextEditingController();
  final toggleMessageBoxController = Get.put(ToggleMessageBoxController());

  bool validateInput() {
    if (email.text.trim().isEmpty) {
      toggleMessageBoxController.updateState(true, 'All fields are required.', AlertType.error, true);
      return false;
    }
    return true;
  }

  Future<void> recoverAccount () async {
    if (!validateInput()) return;

    try {
      await AuthenticationController.instance.sendPasswordResetEmail(email.text.trim());
      toggleMessageBoxController.updateState(
          true,
          "A password reset email has been sent to your email address. "
              "Please check your inbox and follow the link to reset your password. "
              "Once you've updated your password, return to the app and sign in "
              "with your new credentials.",
          AlertType.info,
          false
      );
      await Future.delayed(const Duration(seconds: 5));
      Get.back();
    } catch (e) {
      toggleMessageBoxController.updateState(
          true,
          e.toString(),
          AlertType.error,
          true
      );
    }
  }

  @override
  void onClose() {
    email.dispose();
    toggleMessageBoxController.hideMessage();
    super.onClose();
  }
}