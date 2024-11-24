import 'package:car_renr_app/screens/login/forgot_password_screen.dart';
import 'package:car_renr_app/screens/main/main_screen.dart';
import 'package:car_renr_app/screens/onboarding/onboarding_screen.dart';
import 'package:car_renr_app/screens/login/otp_verification_screen.dart';
import 'package:car_renr_app/screens/login/recover_account_screen.dart';
import 'package:car_renr_app/screens/login/signin_screen.dart';
import 'package:car_renr_app/screens/login/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const OnboardingScreen(),
        initialRoute: '/onboarding',
        routes: {
          '/onboarding' : (context) => const OnboardingScreen(),
          '/signin' : (context) => const SignInPage(),
          '/signup' : (context) => const SignUpPage(),
          '/forgotpassword' : (context) => const ForgotPasswordPage(),
          '/otpVerification' : (context) => const OtpVerificationScreen(),
          '/accountrecovery' : (context) => const AccountRecoveryPage(),
          '/main' : (context) => const MainScreen(),
        },
    );
  }
}
