import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:horizon/config/theme/app_colors.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';

class StarBuck extends StatelessWidget {
  const StarBuck({super.key});

  @override
  Widget build(BuildContext context) {
    return LargeCard(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/starbuck.png'),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),

                Positioned(
                  right: 16,
                  top: 8,
                  child: CustomCard(
                    bgColor: Colors.grey,
                    child: Icon(Icons.watch_later_outlined),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/sb.png'),
                  ),
                ),
              ],
            ),
          ),
          Text('Starbucks'),
          Row(
            spacing: 8,
            children: [Icon(Icons.fastfood), Text('10% cashback & off')],
          ),
        ],
      ),
    );
  }
}
