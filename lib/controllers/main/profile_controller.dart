

import 'package:car_renr_app/controllers/authentication/authentication_controller.dart';
import 'package:car_renr_app/models/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileUser get instance => Get.find();

  final ProfileUser user = ProfileUser(
      id: AuthenticationController.instance.firebaseUser.value!.uid,
      name: AuthenticationController.instance.firebaseUser.value?.displayName ?? "No name",
      email: AuthenticationController.instance.firebaseUser.value?.email ?? "no mail",
      profilePictureUrl: AuthenticationController.instance.firebaseUser.value?.photoURL ?? ''
  );

}