import 'package:car_renr_app/widgets/login_register_widgets/scoial_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/login_register_widgets/Login_divider.dart';
import 'package:car_renr_app/widgets/login_register_widgets/password_field.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_button.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_textfield.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  void loginAttempt (context) {
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  const Text(
                    'Welcome to, Pikbil 👌',
                    style: TextStyle(
                        color: primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  const Text(
                    'Enter your pikbil account to continue',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SignInUpPageTextField(label: 'Email Address', hint: 'Your email address', inputType: TextInputType.emailAddress,),
                  const SizedBox(height: 20,),
                  const PasswordField(),
                  const SizedBox(height: 20,),
                  SignInUpPageButton(label: 'Login', onPressed: () => loginAttempt(context)),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/forgotpassword');
                          },
                          child: const Text('Forgot password?', style: TextStyle(color: Colors.grey),)
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const LoginDivider(label: 'or login with'),
                  const SizedBox(height: 20,),
                  const SocialButtonsWidget(),
                  const SizedBox(height: 20,),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          "Didn't have a pikbil account? ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text(
                            "Register",
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
          )
      )
    );
  }
}