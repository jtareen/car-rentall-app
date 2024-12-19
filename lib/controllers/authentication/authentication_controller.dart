import 'package:car_renr_app/exceptions/authentication_failure.dart';
import 'package:car_renr_app/views/login/email_verification_screen.dart';
import 'package:car_renr_app/views/login/signin_screen.dart';
import 'package:car_renr_app/views/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../views/onboarding/onboarding_screen.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    _setInitialScreen();
  }

  Future<void> _setInitialScreen() async {
    final isFirstTime = await _isFirstTimeUser();

    if (isFirstTime) {
      Get.offAll(() => OnboardingScreen());
    } else {
      setInitialScreen(firebaseUser.value);
    }
  }

  Future<bool> _isFirstTimeUser() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool('isFirstTimeUser') ?? true;

    if (isFirstTime) {
      await prefs.setBool('isFirstTimeUser', false); // Mark as visited
    }

    return isFirstTime;
  }

  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => SignInPage())
        : user.emailVerified
            ? Get.offAll(() => const MainScreen())
            : Get.to(() => EmailVerificationScreen());
  }

  /*  User Registration Function  */
  Future<void> registerUser(String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);

      if (firebaseUser.value != null) {
        await firebaseUser.value!.updateDisplayName(name);
      }
    } on FirebaseAuthException catch (e) {
      final ex = AuthenticationFailure.code(e.code);
      throw ex.message;
    } catch (e) {
      const ex = AuthenticationFailure();
      throw ex.message;
    }
  }
  /*  User Registration Function  */

  /*  Login User Function  */
  Future<void> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = AuthenticationFailure.code(e.code);
      throw ex.message;
    } catch (e) {
      const ex = AuthenticationFailure();
      throw ex.message;
    }
  }
  /*  Login User Function  */

  /*  Email Verification  */
  Future<void> sendVerificationEmail() async {
    try {
      if (firebaseUser.value != null) {
        await firebaseUser.value!.sendEmailVerification();
        Get.snackbar("Success", "Verification email sent!");
      } else {
        throw Exception('No user found please try to login again');
      }
    } on FirebaseAuthException catch (e) {
      throw ("Error ${e.code}", "Failed to send verification email: $e");
    } catch (e) {
      throw ("Error", "Failed to send verification email: $e");
    }
  }
  /*  Email Verification  */

  /*  Password Reset Email  */
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Verification email sent!");
    } on FirebaseAuthException catch (e) {
      final ex = AuthenticationFailure.code(e.code);
      throw ex.message;
    } catch (e) {
      const ex = AuthenticationFailure();
      throw ex.message;
    }
  }
  /*  Password Reset Email  */

  /*  Sign Out Function  */
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAll(() => SignInPage()); // Navigate back to the SignInPage
    } catch (e) {
      print('Error during sign out: ${e.toString()}');
    }
  }
  /*  Sign Out Function  */
}