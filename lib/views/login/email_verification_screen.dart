import 'package:car_renr_app/constants/styles.dart';
import 'package:car_renr_app/controllers/email_verification_controller.dart';
import 'package:car_renr_app/widgets/async_button.dart';
import 'package:car_renr_app/widgets/login_register_widgets/countdown_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({super.key});

  final controller = Get.put(EmailVerificationController());

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
                      text: controller.userEmail,
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
                  onPressed: controller.sendVerificationEmail
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