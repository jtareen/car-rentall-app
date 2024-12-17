import 'package:car_renr_app/constants/message_box_type.dart';
import 'package:car_renr_app/models/signin_textfield_model.dart';
import 'package:car_renr_app/widgets/async_button.dart';
import 'package:car_renr_app/widgets/error_dialog.dart';
import 'package:car_renr_app/widgets/toggle_message_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:car_renr_app/constants/styles.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_button.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  // final TextEditingController _emailController = TextEditingController();
  // // final GlobalKey<ToggleMessageBoxState> _toggleMessageBoxKey = GlobalKey();
  //
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //
  //   _emailController.dispose();
  // }
  //
  // bool _validateInput() {
  //   if (_emailController.text.trim().isEmpty) {
  //     _toggleMessageBoxKey.currentState?.updateState(true, 'All fields are required.', AlertType.error, true);
  //     return false;
  //   }
  //   return true;
  // }
  //
  // Future<void> _recoverAccount () async {
  //   if (!_validateInput()) return;
  //
  //   String email = _emailController.text.trim();
  //   print(email);
  //
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //     _toggleMessageBoxKey.currentState?.updateState(
  //         true,
  //         "A password reset email has been sent to your email address. Please check your inbox and follow the link to reset your password. Once you've updated your password, return to the app and sign in with your new credentials.",
  //         AlertType.info,
  //         false
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     String message;
  //     if (e.code == 'network-request-failed') {
  //       _showErrorDialog('Network Error', 'Make sure you are connected to network');
  //       return ;
  //     } else if (e.code == 'invalid-email') {
  //       message = "Please Enter a valid email";
  //     } else {
  //       message = 'Error[${e.code}] : ${e}';
  //     }
  //
  //     _toggleMessageBoxKey.currentState?.updateState(
  //         true,
  //         message,
  //         AlertType.error,
  //         true
  //     );
  //   } catch (e) {
  //     _showSnackBar('Error : $e');
  //   }
  // }
  //
  // void _showErrorDialog (title, message) {
  //   showErrorDialog(context, title, message);
  // }
  //
  // void _showSnackBar(String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: primary,)
          ),
        ),
        backgroundColor: Colors.white,
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
                    // const SizedBox(height: 20,),
                    // SignInUpPageTextField(
                    //   model: SignInUpPageTextFieldModel(
                    //     label: 'Email Address',
                    //     hint: 'Your email address',
                    //     inputType: TextInputType.emailAddress,
                    //     controller: _emailController,
                    //     ),
                    //   ),
                    // const SizedBox(height: 20,),
                    // AsyncButton(label: 'Recover Account', onPressed: _recoverAccount),
                    // const SizedBox(height: 10,),
                    // ToggleMessageBox(key: _toggleMessageBoxKey,)
                  ]
              ),
            )
        )
    );
  }
}