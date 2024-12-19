import 'package:car_renr_app/controllers/login/signup_screen_controller.dart';
import 'package:car_renr_app/models/signin_textfield_model.dart';
import 'package:car_renr_app/views/login/widgets/Login_divider.dart';
import 'package:car_renr_app/views/login/widgets/scoial_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_renr_app/constants/styles.dart';
import 'package:car_renr_app/widgets/toggle_message_box.dart';
import 'package:car_renr_app/widgets/async_button.dart';
import 'package:car_renr_app/views/login/widgets/password_field.dart';
import 'package:car_renr_app/views/login/widgets/signinup_page_textfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final controller = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
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
                  ToggleMessageBox(),
                  const SizedBox(height: 10,),
                  SignInUpPageTextField(
                    model: SignInUpPageTextFieldModel(
                      label: 'Full name',
                      hint: 'Your full name',
                      inputType: TextInputType.text,
                      controller: controller.fullName,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SignInUpPageTextField(
                    model: SignInUpPageTextFieldModel(
                        label: 'Email Address',
                        hint: 'Your email address',
                        inputType: TextInputType.emailAddress,
                        controller: controller.email
                    ),
                  ),
                  const SizedBox(height: 20,),
                  PasswordField(controller: controller.password,),
                  const SizedBox(height: 20,),
                  AsyncButton(label: 'Register', onPressed: controller.registerUser),
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
                          onTap: () => Get.back(),
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
