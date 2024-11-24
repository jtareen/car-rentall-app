import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/pagination_indicator.dart';
import 'package:flutter/material.dart';

class HomeHeroWidget extends StatefulWidget {
  const HomeHeroWidget({super.key});

  @override
  _homeHeroWidgetState createState() => _homeHeroWidgetState();
}

class _homeHeroWidgetState extends State<HomeHeroWidget> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width > 405 ? 280 : 320,
          child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset('assets/images/onboarding_01.jpeg', height: 220, width: double.infinity, fit: BoxFit.fitWidth,),
                  ),
                  SizedBox(height: 10,),
                  Text('New Year 2022 25% off promo', style: TextStyle(color: primary, fontSize: 25, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset('assets/images/onboarding_02.jpeg', height: 220, width: double.infinity, fit: BoxFit.fitWidth,),
                  ),
                  SizedBox(height: 10,),
                  Text('New Year 2022 25% off promo', style: TextStyle(color: primary, fontSize: 25, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset('assets/images/onboarding_03.jpeg', height: 220, width: double.infinity, fit: BoxFit.fitWidth,),
                  ),
                  SizedBox(height: 10,),
                  Text('New Year 2022 25% off promo', style: TextStyle(color: primary, fontSize: 25, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          ],
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: PaginationIndicator(currentIndex: _currentIndex, itemCount: 3, activeColor: primary,),
        )
    ]
    );
  }
}