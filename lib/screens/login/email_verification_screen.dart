import 'dart:async';

import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/async_button.dart';
import 'package:car_renr_app/widgets/login_register_widgets/countdown_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final GlobalKey<CountdownTimerState> _countdownTimerKey = GlobalKey();
  bool _isVerifying = false;
  bool _isEmailVerified = false;
  late final User? _currentUser;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentUser = FirebaseAuth.instance.currentUser;
    _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (_currentUser != null) {
      _sendVerificationEmail();
      // Automatically refresh every 5 seconds to check if the email is verified
      _timer = Timer.periodic(const Duration(seconds: 5), (_) {
        _checkEmailVerification();
      });
    }
  }

  Future<void> _checkEmailVerification() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      _isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (_isEmailVerified) {
      _timer.cancel(); // Stop the timer once verified
      _navigateToNextPage();
    }
  }

  Future<void> _sendVerificationEmail() async {
    if (_currentUser != null && !_isVerifying) {
      setState(() {
        _isVerifying = true;
      });

      try {
        await _currentUser.sendEmailVerification();
        _countdownTimerKey.currentState?.restartTimer();
        _showSnackBar('Verification email sent to your email');
      } catch (e) {
        _showSnackBar('Error sending verification email: $e');
      } finally {
        setState(() {
          _isVerifying = false;
        });
      }
    }
  }

  void _showSnackBar (String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _navigateToNextPage() {
    // Redirect to the next page after successful verification
    Navigator.pushReplacementNamed(context, '/bottomNavBar'); // Replace '/main' with your actual route
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut(); // Allow user to log out if needed
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: primary,)
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Check your email 📬',
                style: TextStyle(
                    color: primary,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                ),
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  children: [
                    const TextSpan(text: "A verification link has been sent to "),
                    TextSpan(
                      text: _currentUser?.email ?? 'example@email.com',
                      style: const TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ". Please verify your email to proceed."),
                  ],
                ),
              ),
              const SizedBox(height: 20,),

              CountdownTimer(
                duration: 30,
                timeUpWidget: AsyncButton(
                  label: 'Resend Verification Email',
                  onPressed: _sendVerificationEmail
                )),
              const SizedBox(height: 10),
              const Text(
                'You will be redirected automatically once your email is verified.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          )
        )
      )
    );
  }
}