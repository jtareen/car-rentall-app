import 'package:car_renr_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/Login_divider.dart';
import 'package:car_renr_app/widgets/password_field.dart';
import 'package:car_renr_app/widgets/signinup_page_button.dart';
import 'package:car_renr_app/widgets/signinup_page_textfield.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to, Pikbil',
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
            PasswordField(),
            const SizedBox(height: 20,),
            SignInUpPageButton(label: 'Login', onPressed: (){}),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                    child: const Text('Forgot password', style: TextStyle(color: Colors.grey),)
                )
              ],
            ),
            const SizedBox(height: 20,),
            const LoginDivider(label: 'or login with')
          ]
        ),
      )
    );
  }
}



