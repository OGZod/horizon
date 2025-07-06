import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../../core/presentation/widgets/button.dart';

class DiscoverStack extends StatelessWidget {
  const DiscoverStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset('assets/images/products.png'),
        ),
        Container(
          padding: EdgeInsets.all(24),
          width: 377,
          child: Column(
            children: [
              Text(
                'Discover, collect, and sell extraordinary NFTs',
                style: bold.copyWith(fontSize: 24, color: white),
              ),
              SizedBox(height: 16),
              Text(
                'Enter in this creative world. Discover now the latest NFTs or start creating your own!',
                style: medium.copyWith(fontSize: 14, color: white),
              ),
              SizedBox(height: 24),
              Row(
                spacing: 12,
                children: [
                  Button(
                    label: 'Discover now',
                    bgColor: white,
                    textStyle: medium.copyWith(color: black, fontSize: 12),
                  ),
                  Text('Watch Video', style: TextStyle(color: white)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
