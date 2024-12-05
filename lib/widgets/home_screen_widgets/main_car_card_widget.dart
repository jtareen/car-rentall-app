import 'package:car_renr_app/models/car_class.dart';
import 'package:car_renr_app/utils/styles.dart';
import 'package:flutter/material.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(car.imageUrl, height: 150, width: 250, fit: BoxFit.fitWidth ,),
          ),
          SizedBox(height: 10,),
          Text('${car.carCompany} ${car.carName} - ${car.carModel}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
          SizedBox(height: 10,),
          Row(
            children: [
              Image.asset('assets/icons/star_icon.png', height: 27,),
              SizedBox(width: 5,),
              Text('${car.rating}', style: TextStyle(color: primary,fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(width: 5,),
              Text('(${car.reviewCount} Reviews)', style: TextStyle(color: Colors.grey),)
            ],
          ),
          SizedBox(height: 10,),
          RichText(
            text: TextSpan(
              style: TextStyle(color: primary700, fontSize: 20),
              children: [
                TextSpan(
                  text: '\$${car.pricePerDay}', style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' / Day', style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
