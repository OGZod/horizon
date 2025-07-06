import 'package:flutter/material.dart';

import '../../../../../core/presentation/widgets/button.dart';
import '../../../../../core/presentation/widgets/icons/horizon_icon.dart';
import '../../../../../core/presentation/widgets/icons/horizon_icons.dart';
import '../../../dashboard/presentation/widgets/dashboard_cards.dart';

class History extends StatelessWidget {
  const History({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LargeCard(
      height: 500,
      child: Column(
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'History',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Button(label: 'See all'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/brain.png',
                        height: 60,
                        width: 60,
                      ),
                    ),
                    SizedBox(width: 12), // Add spacing
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Colorful Heaven',
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'By Mark Benjamin',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: Row(
                        spacing: 8,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          HorizonIcon(HousifyIcons.eth, size: 10),
                          Flexible(
                            child: Text(
                              '0.91 ETH',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '30s ago',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
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