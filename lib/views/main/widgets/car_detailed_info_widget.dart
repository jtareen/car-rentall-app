
import 'package:car_renr_app/constants/styles.dart';
import 'package:flutter/material.dart';

class CarDetailedInfoWidget extends StatelessWidget {
  final String fuelType;
  final String interiorColor;
  final int kilometers;
  final int seats;
  final String transmission;

  const CarDetailedInfoWidget({
    super.key,
    required this.fuelType,
    required this.interiorColor,
    required this.kilometers,
    required this.seats,
    required this.transmission
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
        const Text(
          "CAR DETAIL",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: primary,
          ),
        ),
        const SizedBox(height: 5.0),
        _buildDetailRow("Fuel", fuelType),
        _buildDetailRow("Interior Color", interiorColor),
        _buildDetailRow("Kilometers", kilometers),
        _buildDetailRow("Seats", seats),
        _buildDetailRow("Transmission", transmission),
        const SizedBox(height: 10,)
      ],
    );
  }

  Widget _buildDetailRow(String label, final value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: primary.withOpacity(0.6),
            ),
          ),
          Text(
            "$value",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: primary,
            ),
          ),
        ],
      ),
    );
  }
}