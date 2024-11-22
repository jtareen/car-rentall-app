import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_button.dart';
import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});
  
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
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Check your email',
                  style: TextStyle(
                      color: primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                  ),
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(text: "We already sent you a 4-digit OTP number to your email "),
                      TextSpan(
                        text: "example@email.com",
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SignInUpPageButton(label: 'Continue', onPressed: (){} ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(text: "Didn't receive OTP number? "),
                        TextSpan(
                          text: "Resend",
                          style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}