import 'package:car_renr_app/controllers/authentication_controller.dart';
import 'package:car_renr_app/views/login/email_verification_screen.dart';
import 'package:car_renr_app/views/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:car_renr_app/firebase_options.dart';
import 'package:car_renr_app/views/onboarding/onboarding_screen.dart';
import 'package:car_renr_app/views/login/forgot_password_screen.dart';
import 'package:car_renr_app/views/login/otp_verification_screen.dart';
import 'package:car_renr_app/views/login/recover_account_screen.dart';
import 'package:car_renr_app/views/login/signin_screen.dart';
import 'package:car_renr_app/views/login/signup_screen.dart';
import 'package:car_renr_app/views/main/bottom_nav_bar.dart';
import 'package:get/get.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(
             options: DefaultFirebaseOptions.currentPlatform
    ).then(
            (value) => Get.put(AuthenticationController())
    );
    runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
    );
  }
}
//
// class InitialScreen extends StatelessWidget {
//   const InitialScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: Firebase.initializeApp(
//             options: DefaultFirebaseOptions.currentPlatform
//         ),
//         builder: (context, snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.done:
//               if (FirebaseAuth.instance.currentUser == null) {
//                 return const OnboardingScreen();
//               } else if (!FirebaseAuth.instance.currentUser!.emailVerified) {
//                 return const EmailVerificationScreen();
//               } else {
//                 return const BottomNavBar();
//               }
//             default:
//               return const Text('Loading...');
//           }
//         }
//     );
//   }
// }