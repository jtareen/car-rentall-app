

import 'package:car_renr_app/models/car_class.dart';
import 'package:car_renr_app/views/main/widgets/car_detailed_info_widget.dart';
import 'package:car_renr_app/views/main/widgets/car_details_screen_app_bar.dart';
import 'package:car_renr_app/views/main/widgets/car_main_info_widget.dart';
import 'package:car_renr_app/views/main/widgets/car_review_list.dart';
import 'package:car_renr_app/views/main/widgets/host_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/async_button.dart';

class CarDetailScreen extends StatelessWidget {
  const CarDetailScreen({super.key, required this.car});
  
  final Car car;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarDetailScreenAppBar(imageUrl: car.imageUrl),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal:  30, vertical: 20,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarMainInfoWidget(
                        name: car.name,
                        carCompany: car.carCompany,
                        modelYear: car.modelYear,
                        description: car.description
                    ),
                    CarDetailedInfoWidget(
                      fuelType: car.fuelType,
                      interiorColor: car.interiorColor,
                      kilometers: car.kilometers,
                      seats: car.seats,
                      transmission: car.transmission,
                    ),
                    HostDetailWidget(
                      hostName: car.hostName,
                      hostLocation: car.hostLocation,
                      hostRating: car.hostRating,
                    ),
                    CarReviewList(reviewList: car.reviews, reviewCount: car.reviewCount,),
                  ],
                ),
              ),
            ],
          )
        ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,
            )
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}