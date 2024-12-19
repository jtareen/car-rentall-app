

import 'package:car_renr_app/constants/styles.dart';
import 'package:flutter/cupertino.dart';

class CarMainInfoWidget extends StatelessWidget {
  final String carCompany;
  final String name;
  final String modelYear;
  final String description;

  const CarMainInfoWidget({super.key, required this.name, required this.carCompany, required this.modelYear, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$carCompany $name - $modelYear', style: const TextStyle(color: primary, fontSize: 19, fontWeight: FontWeight.bold),),
        const SizedBox(height: 5,),
        Text(description, style: TextStyle(color: primary.withOpacity(0.6)),),
        const SizedBox(height: 10,),
      ],
    );
  }
}