import 'package:car_renr_app/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Text('Your Location', style: TextStyle(fontSize: 16, color: Colors.grey[500]),),
                    SizedBox(width: 5,),
                    Image.asset('assets/icons/arrow_down_icon.png')
                  ],
                ),
              ),
              Text('California, Usa', style: TextStyle(color: primary, fontWeight: FontWeight.w600, fontSize: 24),)
            ],
          )),
          IconButton(onPressed: () {}, icon: Image.asset('assets/icons/search_icon.png')),
          SizedBox(width: 5,),
          IconButton(onPressed: () {}, icon: Image.asset('assets/icons/notification_icon.png')),
        ],
      ),
    );
  }
}