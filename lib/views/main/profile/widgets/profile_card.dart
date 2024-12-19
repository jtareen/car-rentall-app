

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/styles.dart';
import '../../../../controllers/main/profile_controller.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Image.network(
                      controller.user.profilePictureUrl,
                      height: 150,
                      width: 150,
                        errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/1.png', height: 150, width: 150,);
                      }
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  controller.user.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  controller.user.email,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}