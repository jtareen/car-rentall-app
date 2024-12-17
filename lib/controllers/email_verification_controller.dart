

import 'package:car_renr_app/controllers/authentication_controller.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    // sendVerificationEmail();
  }

  String get userEmail {
    return AuthenticationController.instance.firebaseUser.value?.email ?? "example@email.com";
  }

  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationController.instance.sendVerificationEmail();
      // restart countdown timer
    } catch (e) {
      Get.snackbar('Error', 'e');
    }
  }


}