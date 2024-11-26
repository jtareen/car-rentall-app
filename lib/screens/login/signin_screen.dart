import 'package:car_renr_app/widgets/login_register_widgets/scoial_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/login_register_widgets/Login_divider.dart';
import 'package:car_renr_app/widgets/login_register_widgets/password_field.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_button.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_textfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState () => _SignInPageState ();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;



  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  void _loginAttempt (context) {
    if (_validateInput()) {
      final email = _email.text.trim();
      final password = _password.text.trim();

      print('Email: $email');
      print('Password: $password');

      // Navigator.pushReplacementNamed(context, '/main');
    }
  }

  bool _validateInput() {
    if (_email.text.trim().isEmpty ||
        _password.text.trim().isEmpty) {
      _showErrorDialog('Validation Error','All fields are required.');
      return false;
    }

    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(_email.text.trim())) {
      _showErrorDialog('Validation Error','Please enter a valid email address.');
      return false;
    }

    return true;
  }

  void _showErrorDialog(String? error,String? message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(error ?? 'Error'),
        content: Text(message ?? 'An Unknown Error Occurred'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
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
                    SignInUpPageTextField(label: 'Email Address', hint: 'Your email address', inputType: TextInputType.emailAddress, controller: _email,),
                    const SizedBox(height: 20,),
                    PasswordField(controller: _password ,),
                    const SizedBox(height: 20,),
                    SignInUpPageButton(label: 'Login', onPressed: () => _loginAttempt(context)),
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