import 'package:car_renr_app/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingPageWidget({
    super.key,
    required this.model
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal:  30.0), child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            double imageWidth = constraints.maxWidth;
            if (constraints.maxWidth > 400) { // Adjust the size condition as needed
              imageWidth = 400; // Limit the image width to 600 when screen width is larger
            }
            return Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  model.imagePath,
                  width: imageWidth,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        Text(
          model.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          model.description,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 20),
      ],
    ),);
  }
}
