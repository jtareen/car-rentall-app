import 'package:car_renr_app/models/car_class.dart';
import 'package:car_renr_app/constants/styles.dart';
import 'package:car_renr_app/views/main/car_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCarCardWidget extends StatelessWidget {
  final Car car;

  const MainCarCardWidget({
    super.key,
    required this.car
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () => Get.to(() => CarDetailScreen(car: car)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(car.imageUrl, height: 150, width: 250, fit: BoxFit.fitWidth ,),
            ),
            const SizedBox(height: 10,),
            Text('${car.carCompany} ${car.name} - ${car.modelYear}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            const SizedBox(height: 10,),
            Row(
              children: [
                Image.asset('assets/icons/star_icon.png', height: 27,),
                const SizedBox(width: 5,),
                Text('${car.carRating}', style: const TextStyle(color: primary,fontSize: 16, fontWeight: FontWeight.bold),),
                const SizedBox(width: 5,),
                Text('(${car.reviewCount} Reviews)', style: const TextStyle(color: Colors.grey),)
              ],
            ),
            const SizedBox(height: 10,),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: primary700, fontSize: 20),
                children: [
                  TextSpan(
                    text: '\$${car.pricePerDay}', style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: ' / Day', style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
