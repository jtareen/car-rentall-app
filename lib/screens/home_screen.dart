import 'package:car_renr_app/models/car_class.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/home_screen_widgets/header.dart';
import 'package:car_renr_app/widgets/home_screen_widgets/hero.dart';
import 'package:car_renr_app/widgets/home_screen_widgets/home_car_card_widget.dart';
import 'package:flutter/material.dart';

// Separate Scaffold for Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeScreenHeader(),
            HomeHeroWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top vehicles', style: TextStyle(color: primary, fontSize: 23, fontWeight: FontWeight.w600),),
                  TextButton(onPressed: () {}, child: Text('See all', style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),))
                ],
              ),
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //       children: carList.map((car) => HomeCarCardWidget(car: car)).toList()
            //   ),
            // )
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  HomeCarCardWidget(car: carList[0]),
                  HomeCarCardWidget(car: carList[1]),
                  HomeCarCardWidget(car: carList[2]),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}