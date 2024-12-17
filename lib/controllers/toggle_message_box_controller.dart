

import 'package:get/get.dart';

import '../constants/message_box_type.dart';

class ToggleMessageBoxController extends GetxController {
  var isVisible = false.obs;
  var message = ''.obs;
  var alertType = AlertType.success.obs;
  var showIcon = false.obs;

  // Method to update the state
  void updateState(bool visibility, String? newMessage, AlertType type, bool showCloseIcon) {
    isVisible.value = visibility;
    message.value = newMessage ?? '';
    alertType.value = type;
    showIcon.value = showCloseIcon;
  }

  void hideMessage() {
    isVisible.value = false;
    message.value = '';
  }
}