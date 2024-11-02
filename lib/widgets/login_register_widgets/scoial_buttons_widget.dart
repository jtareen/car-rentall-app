import 'package:flutter/material.dart';

class SocialButtonsWidget extends StatelessWidget {
  const SocialButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Button
        _buildSocialButton(
            icon: Image.asset('assets/icons/google-color-icon.png')
        ),
        const SizedBox(width: 16), // Space between buttons
        // Facebook Button
        _buildSocialButton(
            icon: Image.asset('assets/icons/facebook-round-color-icon.png')
        ),
      ],
    );
  }

  Widget _buildSocialButton({required Widget icon}) {
    return Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!, width: 2),
        ),
        child: icon
    );
  }
}