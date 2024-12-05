import 'package:car_renr_app/models/message_box_type.dart';
import 'package:car_renr_app/widgets/async_button.dart';
import 'package:car_renr_app/widgets/toggle_message_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/error_dialog.dart';
import 'package:car_renr_app/widgets/login_register_widgets/scoial_buttons_widget.dart';
import 'package:car_renr_app/widgets/login_register_widgets/Login_divider.dart';
import 'package:car_renr_app/widgets/login_register_widgets/password_field.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_textfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState () => _SignInPageState ();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  final GlobalKey<ToggleMessageBoxState> _toggleMessageBoxKey = GlobalKey();


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

  Future<void> _loginAttempt () async {
    if (!_validateInput()) return ;

    final email = _email.text.trim();
    final password = _password.text.trim();

    try {
      // Sign in using email and password
      UserCredential userCredential = await FirebaseAuth.
         instance.signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;

      if (user != null) {
        // check if user is verified or not
        if (user.emailVerified) {
            _loginToApp();
        } else {
          _navigateToVerificationPage ();
        }
      } else {
        throw Exception('Unknown Error: user not retrieved');
      }

    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'network-request-failed') {
        _showErrorDialog('Network Error', 'Make sure you are connected to network');
        return ;
      } else if (e.code == 'invalid-email') {
        message = 'Please enter a valid email address';
      } else if (e.code == 'invalid-credential') {
        message = 'Provided Email and Password do not match. Please provide valid credentials.';
      } else {
        message = "Login failed: ${e.message}";
      }

      _toggleMessageBoxKey.currentState?.updateState(true, message, AlertType.error, true);
    } catch (e) {
      _toggleMessageBoxKey.currentState?.updateState(true, e.toString(), AlertType.error, true);
    }
  }

  bool _validateInput() {
    if (_email.text.trim().isEmpty ||
        _password.text.trim().isEmpty) {
      _toggleMessageBoxKey.currentState?.updateState(true, 'All fields are required.', AlertType.error, true);
      return false;
    }
    return true;
  }

  void  _showErrorDialog (title, message) {
    showErrorDialog(context, title, message);
  }

  void _loginToApp () {
    Navigator.pushReplacementNamed(context, '/bottomNavBar');
  }

  void _navigateToVerificationPage () {
    Navigator.pushNamed(context, '/emailVerification');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                    ToggleMessageBox(key: _toggleMessageBoxKey,),
                    const SizedBox(height: 10,),
                    SignInUpPageTextField(label: 'Email Address', hint: 'Your email address', inputType: TextInputType.emailAddress, controller: _email,),
                    const SizedBox(height: 20,),
                    PasswordField(controller: _password ,),
                    const SizedBox(height: 20,),
                    AsyncButton(label: 'Login', onPressed: _loginAttempt,),
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