import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/login_register_widgets/countdown_timer.dart';
import 'package:car_renr_app/widgets/login_register_widgets/otp_text_field.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerificationScreen extends StatelessWidget {
  final bool accountRecovery;

  const OtpVerificationScreen({super.key, this.accountRecovery = false});
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as bool?;
    final isAccountRecovery = args ?? accountRecovery;
    double screenWidth = MediaQuery.of(context).size.width;

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
                  'Check your email 📬',
                  style: TextStyle(
                      color: primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                  ),
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: const TextSpan(
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
                const SizedBox(height: 20,),
                OtpTextField(
                  showFieldAsBox: true,
                  focusedBorderColor: primary,
                  fieldWidth: screenWidth < 500 ?  (screenWidth - 120) / 4 : 380 / 4,
                  contentPadding: screenWidth > 300 ? const EdgeInsets.symmetric(vertical: 20) : const EdgeInsets.symmetric(vertical: 18),
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(15),
                  textStyle: const TextStyle(fontSize: 20),
                  mainAxisAlignment: screenWidth < 500 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.spaceEvenly,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                const SizedBox(height: 20,),
                const CountdownTimer(duration: 30,),
                const SizedBox(height: 20,),
                SignInUpPageButton(label: 'Continue', onPressed: (){
                    if (isAccountRecovery) {
                      Navigator.pushNamed(context, '/accountrecovery');
                    }
                    else {

                    }
                } ),
                const SizedBox(height: 20,),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        "Didn't receive OTP number? ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // handle resend
                        },
                        child: const Text(
                          "Resend",
                          style: TextStyle(
                            color: primary, // Adjust color as needed
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}