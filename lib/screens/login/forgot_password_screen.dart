import 'package:flutter/material.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_button.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: primary,)
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Forgot Password? 🔒',
                      style: TextStyle(
                          color: primary,
                          fontSize: 24,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const Text(
                      'Please input your email to recover your pikbil account.',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SignInUpPageTextField(label: 'Email Address', hint: 'Your email address', inputType: TextInputType.emailAddress,),
                    const SizedBox(height: 20,),
                    SignInUpPageButton(label: 'Recover Account', onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/otpVerification',
                        arguments: true, // Pass the accountRecovery value here
                      );
                    }),
                  ]
              ),
            )
        )
    );
  }
}