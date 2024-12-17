import 'package:car_renr_app/controllers/signin_screen_controller.dart';
import 'package:car_renr_app/models/signin_textfield_model.dart';
import 'package:car_renr_app/views/login/forgot_password_screen.dart';
import 'package:car_renr_app/views/login/signup_screen.dart';
import 'package:car_renr_app/widgets/async_button.dart';
import 'package:car_renr_app/widgets/toggle_message_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:car_renr_app/constants/styles.dart';
import 'package:car_renr_app/widgets/login_register_widgets/scoial_buttons_widget.dart';
import 'package:car_renr_app/widgets/login_register_widgets/Login_divider.dart';
import 'package:car_renr_app/widgets/login_register_widgets/password_field.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_textfield.dart';
import 'package:get/get.dart';

import '../../constants/message_box_type.dart';
import '../../widgets/error_dialog.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final controller = Get.put(SignInScreenController());

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

                    /*  Top Section  */
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
                    /*  Top Section  */

                    ToggleMessageBox(),

                    /*  Form Section  */
                    const SizedBox(height: 10,),
                    SignInUpPageTextField(
                      model: SignInUpPageTextFieldModel(
                        label: 'Email Address',
                        hint: 'Your email address',
                        inputType: TextInputType.emailAddress,
                        controller: controller.email,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    PasswordField(controller: controller.password ,),
                    const SizedBox(height: 20,),
                    AsyncButton(label: 'Login', onPressed: controller.loginAttempt,),
                    const SizedBox(height: 20,),
                    /*  Form Section  */

                    /*  Footer Section  */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.to(() => const ForgotPasswordPage());
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
                            onTap: () => Get.to(() => SignUpPage()),
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
                    /*  Footer Section  */
                  ]
              ),
            )
        )
    );
  }
}

