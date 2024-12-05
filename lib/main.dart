import 'package:car_renr_app/screens/login/email_verification_screen.dart';
import 'package:car_renr_app/screens/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:car_renr_app/firebase_options.dart';
import 'package:car_renr_app/screens/onboarding/onboarding_screen.dart';
import 'package:car_renr_app/screens/login/forgot_password_screen.dart';
import 'package:car_renr_app/screens/login/otp_verification_screen.dart';
import 'package:car_renr_app/screens/login/recover_account_screen.dart';
import 'package:car_renr_app/screens/login/signin_screen.dart';
import 'package:car_renr_app/screens/login/signup_screen.dart';
import 'package:car_renr_app/screens/main/bottom_nav_bar.dart';
import 'package:get/get.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingScreen(),
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