import 'package:flutter/material.dart';
import 'package:horizon/config/theme/app_colors.dart';
import 'package:horizon/config/theme/text_styles.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';

import '../../../../../../../core/presentation/widgets/button.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LargeCard(
      hasPadding: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              spacing: 16,
              children: [
                CustomCard(child: Icon(Icons.local_fire_department)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Business design',
                      style: bold.copyWith(color: cardText),
                    ),
                    Text('New lesson is available'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 16),
            child: Text('What do you need to know to create better products?'),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadiusGeometry.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            padding: EdgeInsets.all(24),
            child: Column(
              spacing: 24,
              children: [
                Row(
                  spacing: 16,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.timer, color: green),
                        Text('85 mins'),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.slow_motion_video, color: red),
                        Text('Video format'),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 40,
                      child: Stack(
                        children: List.generate(
                          (6),
                          (index) => Positioned(
                            left: index * 16,
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Theme.of(context).canvasColor,
                                  width: 2,
                                ),
                                color: Theme.of(context).cardColor,
                                image: index != 5
                                    ? DecorationImage(
                                        image: AssetImage(
                                          'assets/images/header_avatar.png',
                                        ),
                                      )
                                    : null,
                              ),
                              child: Visibility(
                                visible: index == 5,
                                child: Center(
                                  child: Text(
                                    '18+',
                                    textAlign: TextAlign.center,
                                    style: bold.copyWith(fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Button(label: 'Get Started',),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

