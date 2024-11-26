import 'package:car_renr_app/widgets/error_container.dart';
import 'package:car_renr_app/widgets/error_dialog.dart';
import 'package:car_renr_app/widgets/login_register_widgets/scoial_buttons_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/login_register_widgets/Login_divider.dart';
import 'package:car_renr_app/widgets/login_register_widgets/password_field.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_button.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState () => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _fullName;
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool _errorStatus = false;
  String? _errorMessage;

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
      setState(() {
        _errorStatus = true;
        _errorMessage = 'All fields are required.';
      });

      return false;
    }

    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(_email.text.trim())) {
      setState(() {
        _errorStatus = true;
        _errorMessage = 'Please enter a valid email address.';
      });
      return false;
    }

    return true;
  }


  Future<bool?> registerUser(String email, String password, String name) async {
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

      // Return success message or user ID
      return true;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      if (e.code == 'weak-password') {
        setState(() {
          _errorStatus = true;
          _errorMessage = "The password provided is too weak.";
        });
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          _errorStatus = true;
          _errorMessage = "The account already exists for that email.";
        });
      } else if (e.code == 'invalid-email') {
        setState(() {
          _errorStatus = true;
          _errorMessage = "The email address is not valid.";
        });
      } else if (e.code == 'network-request-failed') {
        showErrorDialog(context, 'Network Error', 'Please make sure you are connected to a network');
      } else  {
        setState(() {
          _errorStatus = true;
          _errorMessage = "Registration failed: '${e.code}' ${e.message}";
        });
      }
      return false;
    } catch (e) {
      // Handle other errors
      setState(() {
        _errorStatus = true;
        _errorMessage = "An error occurred: $e";
      });
      return false;
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
                  SignInUpPageTextField(label: 'Full name', hint: 'Your full name', inputType: TextInputType.text, controller: _fullName,),
                  const SizedBox(height: 20,),
                  SignInUpPageTextField(label: 'Email Address', hint: 'Your email address', inputType: TextInputType.emailAddress, controller: _email,),
                  const SizedBox(height: 20,),
                  PasswordField(controller: _password,),
                  const SizedBox(height: 20,),
                  SignInUpPageButton(label: 'Register', onPressed: () async {
                    // Navigator.pushNamed(context, '/otpVerification');
                    if (_validateInput()) {

                      final fullName = _fullName.text.trim();
                      final email = _email.text.trim();
                      final password = _password.text.trim();

                      bool? result = await registerUser(email, password, fullName);
                      bool status = result ?? false;
                      print(status ? "User registered successfully" : _errorMessage); // Show result in UI (e.g., Snackbar or AlertDialog)
                    }
                  }),
                  const SizedBox(height: 10,),
                  _errorStatus ? ErrorContainer(message: _errorMessage ?? 'An error occurred', onPressed: () {
                    setState(() {
                      _errorStatus = false;
                      _errorMessage = null;
                    });
                  },) : const SizedBox.shrink(),
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
                  )
                ]
            ),
          ),
        )
    );
  }
}

