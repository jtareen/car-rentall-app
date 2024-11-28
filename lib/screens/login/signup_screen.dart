import 'package:car_renr_app/models/message_box_type.dart';
import 'package:car_renr_app/widgets/error_dialog.dart';
import 'package:car_renr_app/widgets/toggle_message_box.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:car_renr_app/widgets/async_button.dart';
import 'package:car_renr_app/widgets/login_register_widgets/scoial_buttons_widget.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/login_register_widgets/Login_divider.dart';
import 'package:car_renr_app/widgets/login_register_widgets/password_field.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState () => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<ToggleMessageBoxState> _toggleMessageBoxKey = GlobalKey();

  late final TextEditingController _fullName;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override void initState() {
    // TODO: implement initState
    super.initState();

    _fullName = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override void dispose() {
    // TODO: implement dispose
    super.dispose();

    _fullName.dispose();
    _email.dispose();
    _password.dispose();
  }

  bool _validateInput() {
    if (_fullName.text.trim().isEmpty ||
        _email.text.trim().isEmpty ||
        _password.text.trim().isEmpty) {

      _toggleMessageBoxKey.currentState?.updateState(true, 'All fields required', AlertType.error, true);

      return false;
    }

    return true;
  }

  Future<void> _registerUser() async {
    if (!_validateInput()) return ;

    final email = _email.text.trim();
    final password = _password.text.trim();
    final name = _fullName.text.trim();

    try {
      // Create a new user with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Get the user object
      User? user = userCredential.user;

      if (user != null) {
        // Update the user's display name
        await user.updateDisplayName(name);
        await user.reload(); // Reload user to ensure the name is updated
      }

      // show A message to user requiring to confirm email
      _toggleMessageBoxKey.currentState
          ?.updateState(
              true,
              'Thank you for signing up! We’ve sent a confirmation email to your registered email address (${_email.text.trim()}). Please check your inbox (and spam folder) to verify your email. Once verified, you’ll be able to log in and access your account.',
              AlertType.success,
              false
      );
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors

      String errorMessage;
      if (e.code == 'network-request-failed') {
        showErrorDialog(context, 'Network Error', 'Make sure you are connected to network');
        return ;
      } else if (e.code == 'email-already-in-use') {
        errorMessage = "The account already exists for that email.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "The email address is not valid.";
      } else if (e.code == 'weak-password') {
        errorMessage = "The password provided is too weak.";
      } else {
        errorMessage = "Registration failed: ${e.message}";
      }

      // Show error message to user
      _toggleMessageBoxKey.currentState?.updateState(true, errorMessage, AlertType.error, true);
    } catch (e) {
      // Handle other errors and show to user
      _toggleMessageBoxKey.currentState?.updateState(true, "An error occurred: $e", AlertType.error, true,);
    }
  }

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
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
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
                  SignInUpPageTextField(label: 'Full name', hint: 'Your full name', inputType: TextInputType.text, controller: _fullName,),
                  const SizedBox(height: 20,),
                  SignInUpPageTextField(label: 'Email Address', hint: 'Your email address', inputType: TextInputType.emailAddress, controller: _email,),
                  const SizedBox(height: 20,),
                  PasswordField(controller: _password,),
                  const SizedBox(height: 20,),
                  AsyncButton(label: 'Register', onPressed: _registerUser),
                  const SizedBox(height: 10,),
                  ToggleMessageBox(key: _toggleMessageBoxKey,),
                  const SizedBox(height: 20,),
                  const LoginDivider(label: 'or register with'),
                  const SizedBox(height: 20,),
                  const SocialButtonsWidget(),
                  const SizedBox(height: 20,),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          "Already have a pikbil account? ",
                          textAlign: TextAlign.center,
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
                    ),
                  ),
                  const SizedBox(height: 20,),
                ]
            ),
          ),
        )
    );
  }
}
