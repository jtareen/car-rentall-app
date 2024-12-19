import 'package:car_renr_app/constants/styles.dart';
import 'package:car_renr_app/controllers/authentication/authentication_controller.dart';
import 'package:car_renr_app/views/main/profile/edit_profile_screen.dart';
import 'package:car_renr_app/views/main/profile/widgets/profile_card.dart';
import 'package:car_renr_app/widgets/async_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final auth = AuthenticationController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: primary, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Profile Card
          ProfileCard(),
          // Options List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person_outline),
                    title: const Text("Account Profile"),
                    onTap: () => Get.to(EditProfileScreen()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.credit_card),
                    title: const Text("Billing"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock_outline),
                    title: const Text("Change Password"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications_none),
                    title: const Text("Notification"),
                    onTap: () {},
                  ),
                  const SizedBox(height: 20,),
                  AsyncButton(label: 'Sign Out', onPressed: auth.signOut)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}