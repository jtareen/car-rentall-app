
import 'package:car_renr_app/models/car_class.dart';
import 'package:flutter/material.dart';

import '../../../constants/styles.dart';

class CarReviewList extends StatelessWidget {
  final List<Review> reviewList;
  final double reviewCount;

  const CarReviewList({super.key, required this.reviewList, required this.reviewCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        Text(
          "REVIEWS ($reviewCount)",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: primary,
          ),
        ),
        const SizedBox(height: 5.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(reviewList.length, (index) {
                return _buildListTile(reviewList[index]);
          }),
        )
      ],
    );
  }

  Widget _buildListTile (Review review) {
    return Column(
      children: [
        Row(
          children: [
            Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(review.reviewerProfileUrl, height: 50, width: 50,),
                ),
                Positioned(
                bottom: -10, // Adjust position to stack on the avatar
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '${review.rating}',
                        style:const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black,),
                      ),
                    ],
                  ),
                )),
              ]
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(review.reviewerName, style: const TextStyle(color: primary, fontWeight: FontWeight.w600),),
                            Text(review.date, style: TextStyle(color: primary.withOpacity(0.6), fontSize: 13),)
                          ],
                        ),
                      ),
                      Text('"${review.comment}"', style: TextStyle(color: primary.withOpacity(0.6)),)
                    ],
                  ),
                )
            ),
          ],
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}