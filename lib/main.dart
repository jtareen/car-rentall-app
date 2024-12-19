import 'package:car_renr_app/controllers/authentication/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:car_renr_app/firebase_options.dart';
import 'package:get/get.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(
             options: DefaultFirebaseOptions.currentPlatform
    ).then(
            (value) => Get.put(AuthenticationController())
    );
    runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
    );
  }}