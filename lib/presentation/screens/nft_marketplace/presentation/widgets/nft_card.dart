import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../config/theme/text_styles.dart';
import '../../../../../core/presentation/widgets/button.dart';

class NFTCard extends StatelessWidget {
  const NFTCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      width: 350,
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/nft.png',
                  height: 200,
                  width: 300,
                ),
              ),
              Positioned(
                right: 16,
                top: 16,
                child: CircleAvatar(
                  child: Icon(Icons.favorite_border, color: active),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('Abstract Colors'), Text('By Esthera Jackson')],
              ),
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Current Bid: 0.91 ETH'),
              Button(label: 'Place Bid'),
            ],
          ),
        ],
      ),
    );
  }
}
