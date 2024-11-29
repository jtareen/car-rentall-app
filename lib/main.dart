import 'package:car_renr_app/screens/login/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:car_renr_app/firebase_options.dart';
import 'package:car_renr_app/screens/onboarding/onboarding_screen.dart';
import 'package:car_renr_app/screens/login/forgot_password_screen.dart';
import 'package:car_renr_app/screens/login/otp_verification_screen.dart';
import 'package:car_renr_app/screens/login/recover_account_screen.dart';
import 'package:car_renr_app/screens/login/signin_screen.dart';
import 'package:car_renr_app/screens/login/signup_screen.dart';
import 'package:car_renr_app/screens/main/main_screen.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    runApp(const MainApp());
  } on Exception catch (e) {
    print('an error occurred');
    print(e.runtimeType);
  }
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
          '/emailVerification': (context) => const EmailVerificationScreen(),
          '/accountrecovery' : (context) => const AccountRecoveryPage(),
          '/main' : (context) => const MainScreen(),
        },
    );
  }
}
