import 'dart:async';

import 'package:car_renr_app/controllers/authentication_controller.dart';
import 'package:car_renr_app/controllers/countdown_timer_widget_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  final _auth = AuthenticationController.instance;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }

  String get userEmail {
    return _auth.firebaseUser.value?.email ?? "example@email.com";
  }

  Future<void> sendVerificationEmail() async {
    try {
      await _auth.sendVerificationEmail();
      CountdownTimerController.instance.restartTimer(30);
    } catch (e) {
      Get.snackbar('Error', 'e');
    }
  }

  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user!.emailVerified) {
        _timer.cancel();
        _auth.setInitialScreen(user);
      }
    });
  }
}