
import 'package:car_renr_app/constants/styles.dart';
import 'package:flutter/material.dart';

class HostDetailWidget extends StatelessWidget {
  final String hostName;
  final String hostLocation;
  final double hostRating;
  const HostDetailWidget({super.key, required this.hostName, required this.hostLocation, required this.hostRating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        const Text(
          "HOST DETAIL",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: primary,
          ),
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/1.png', height: 50, width: 50,),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hostName, style: const TextStyle(color: primary, fontWeight: FontWeight.w600),),
                      const SizedBox(height: 5,),
                      Text(hostLocation, style: TextStyle(color: primary.withOpacity(0.6), fontSize: 12),),
                    ],
                  ),
                )
            ),
            const Icon(Icons.star, color: Colors.amber,),
            const SizedBox(width: 4,),
            Text('$hostRating', style: const TextStyle(fontWeight: FontWeight.w600),)
          ],
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}