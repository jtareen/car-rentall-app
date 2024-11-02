import 'package:car_renr_app/widgets/login_register_widgets/scoial_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/login_register_widgets/Login_divider.dart';
import 'package:car_renr_app/widgets/login_register_widgets/password_field.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_button.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nice to know you!',
                    style: TextStyle(
                        color: primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const Text(
                    "It's you first time to use pikbil",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SignInUpPageTextField(label: 'Full name', hint: 'Your full name', inputType: TextInputType.text),
                  const SizedBox(height: 20,),
                  SignInUpPageTextField(label: 'Email Address', hint: 'Your email address', inputType: TextInputType.emailAddress,),
                  const SizedBox(height: 20,),
                  PasswordField(),
                  const SizedBox(height: 20,),
                  SignInUpPageButton(label: 'Register', onPressed: (){}),
                  const SizedBox(height: 20,),
                  const LoginDivider(label: 'or register with'),
                  const SizedBox(height: 20,),
                  const SocialButtonsWidget(),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have a pikbil account? ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: primary, // Adjust color as needed
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                ]
            ),
          ),
        )
    );
  }
}



