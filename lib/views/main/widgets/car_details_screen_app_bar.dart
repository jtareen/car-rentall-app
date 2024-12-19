
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarDetailScreenAppBar extends StatelessWidget {
  final String imageUrl;
  const CarDetailScreenAppBar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
        height: 250, // Set height for the AppBar
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imageUrl, // Replace with your image URL
              fit: BoxFit.cover,
            ),
            Container(color: Colors.black.withOpacity(0.1),),
          ],
        )
    );
  }
}