import 'package:car_renr_app/controllers/login/forgot_password_controller.dart';
import 'package:car_renr_app/models/signin_textfield_model.dart';
import 'package:car_renr_app/widgets/async_button.dart';
import 'package:car_renr_app/widgets/toggle_message_box.dart';
import 'package:flutter/material.dart';
import 'package:car_renr_app/constants/styles.dart';
import 'package:car_renr_app/views/login/widgets/signinup_page_textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final controller = ForgotPasswordScreenController();

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
                    const SizedBox(height: 20,),
                    SignInUpPageTextField(
                      model: SignInUpPageTextFieldModel(
                        label: 'Email Address',
                        hint: 'Your email address',
                        inputType: TextInputType.emailAddress,
                        controller: controller.email,
                        ),
                      ),
                    const SizedBox(height: 20,),
                    AsyncButton(label: 'Recover Account', onPressed: controller.recoverAccount),
                    const SizedBox(height: 10,),
                    ToggleMessageBox()
                  ]
              ),
            )
        )
    );
  }
}