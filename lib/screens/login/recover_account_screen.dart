import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/login_register_widgets/password_field.dart';
import 'package:car_renr_app/widgets/login_register_widgets/signinup_page_button.dart';
import 'package:flutter/material.dart';

class AccountRecoveryPage extends StatelessWidget {
  final bool accountRecovery;

  const AccountRecoveryPage({super.key, this.accountRecovery = false});

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
                  'Create new password 🔑',
                  style: TextStyle(
                      color: primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const Text(
                  'Please create new password of your pikbil account to access again your account.',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                  ),
                ),
                const SizedBox(height: 20,),
                const PasswordField(),
                const SizedBox(height: 20,),
                const PasswordField(label: 'Retype password', hint: 'Retype your password',),
                const SizedBox(height: 20,),
                SignInUpPageButton(label: 'Confirm Password', onPressed: (){
                } ),
              ]
          ),
        ),
      ),
    );
  }
}