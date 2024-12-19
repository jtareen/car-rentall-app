import 'package:car_renr_app/models/car_class.dart';
import 'package:car_renr_app/constants/styles.dart';
import 'package:car_renr_app/widgets/async_button.dart';
import 'package:flutter/material.dart';

import 'widgets/header.dart';
import 'widgets/hero.dart';
import 'widgets/main_car_card_widget.dart';

// Separate Scaffold for Home Screen
class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FeedScreenHeader(),
            const MainHeroWidget(),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Top vehicles', style: TextStyle(color: primary, fontSize: 23, fontWeight: FontWeight.w600),),
                  TextButton(onPressed: () {}, child: const Text('See all', style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),))
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 10, bottom: 30),
                child: Row(
                    children: carList.map((car) => MainCarCardWidget(car: car)).toList()
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}