import 'package:car_renr_app/models/car_class.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:car_renr_app/widgets/home_screen_widgets/header.dart';
import 'package:car_renr_app/widgets/home_screen_widgets/hero.dart';
import 'package:car_renr_app/widgets/home_screen_widgets/main_car_card_widget.dart';
import 'package:flutter/material.dart';

// Separate Scaffold for Home Screen
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainScreenHeader(),
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
      )
    );
  }
}