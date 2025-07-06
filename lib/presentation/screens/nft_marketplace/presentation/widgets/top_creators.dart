import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../core/presentation/widgets/button.dart';
import '../../../dashboard/presentation/widgets/dashboard_cards.dart';
import '../../../dashboard/presentation/widgets/table_header_text.dart';

class TopCreators extends StatelessWidget {
  const TopCreators({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LargeCard(
      hasPadding: false,
      height: 500,
      child: Column(
        spacing: 8,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              spacing: 16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        'Trending Creators',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Button(label: 'See all'),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TableHeaderText(title: 'Name'),
                    ),
                    Expanded(
                      flex: 2,
                      child: TableHeaderText(title: 'Artworks'),
                    ),
                    Expanded(
                      flex: 2,
                      child: TableHeaderText(title: 'Rating'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/avatar_1.png',
                            ),
                            radius: 15,
                          ),
                          SizedBox(width: 8),
                          Flexible( // Added Flexible here
                            child: Text(
                              '@maddison_c21',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '9821',
                        style: TextStyle(color: cardText),
                        overflow: TextOverflow.ellipsis, // Added overflow handling
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: cardWithOpacity,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: (index / 10).clamp(0.0, 1.0), // Added clamp
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF8B5CF6),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}