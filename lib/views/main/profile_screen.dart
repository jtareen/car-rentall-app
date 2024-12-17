import 'package:car_renr_app/constants/styles.dart';
import 'package:car_renr_app/controllers/authentication_controller.dart';
import 'package:car_renr_app/widgets/async_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_common/get_reset.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final User? user = FirebaseAuth.instance.currentUser;

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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [primary800, primary700, primary600]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                              width: 2
                            ),
                            borderRadius: BorderRadius.circular(100)
                          ),
                        child: ClipOval(
                          child: Image.asset('assets/images/6.png', width: 150, height: 150,),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        user!.displayName ?? 'Guest',
                        style: const TextStyle(
                          color: Colors.white,
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user!.email ?? 'email',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Options List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person_outline),
                    title: const Text("Account Profile"),
                    onTap: () {},
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
                  AsyncButton(label: 'Sign Out', onPressed: AuthenticationController.instance.signOut)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}