
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/styles.dart';
import '../../../controllers/main/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final controller = Get.put(ProfileController());

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
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Account Profile', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                          controller.user.profilePictureUrl,
                          height: 100,
                          width: 100,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/images/1.png', height: 100, width: 100,);
                          }
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                            'Change Profile Picture',
                            style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}