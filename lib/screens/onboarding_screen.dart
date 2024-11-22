import 'package:car_renr_app/screens/signin_screen.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/pagination_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _getStarted () {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage())
    );
  }

  void _nextPage() {
    if (_currentIndex < 2) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
    else {
      _getStarted();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              //physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: const [
                BuildPage(
                  imagePath: 'assets/images/onboarding_01.jpeg',
                  title: 'Endless option',
                  description: "Choose from hundreds of models you won't find anywhere else. Pick it up or get it delivered where you want it.",
                ),
                BuildPage(
                  imagePath: 'assets/images/onboarding_02.jpeg',
                  title: 'Drive confidently',
                  description: "Drive confidently with your choice of protection plans. All plans include varying level of insurance from Fakeh insurance",
                ),
                BuildPage(
                  imagePath: 'assets/images/onboarding_03.jpeg',
                  title: '24/7 Support',
                  description: "Rest easy knowing everyone in Pikbil community is screened and support road aside assistant.",
                ),
              ],
            ),
          ),
          // Pagination indicators
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  child: PaginationIndicator(currentIndex: _currentIndex, itemCount: 3, activeColor: primary,)),

                TextButton(
                  onPressed: _getStarted,
                  style: secondaryTextButtonStyle,
                  child: const Text('Skip'),
                ),
                const SizedBox(width: 5,),
                TextButton(
                    onPressed: _nextPage,
                    style: primaryTextButtonStyle,
                      child: const Text('Next'),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}


class BuildPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const BuildPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
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
                  imagePath,
                  width: imageWidth,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 20),
      ],
    ),);
  }
}
