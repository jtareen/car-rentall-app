import 'package:flutter/material.dart';

class PaginationIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final Color activeColor;
  final Color inactiveColor;

  const PaginationIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
    this.activeColor = Colors.blue, // Default active color
    this.inactiveColor = Colors.grey, // Default inactive color
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(itemCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == index ? 25 : 10,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex == index ? activeColor : inactiveColor,
          ),
        );
      }),
    );
  }
}
