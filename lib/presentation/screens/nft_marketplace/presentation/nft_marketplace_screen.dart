import 'package:flutter/material.dart';
import 'package:horizon/config/theme/app_colors.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/widgets/dashboard_cards.dart';
import 'package:horizon/presentation/screens/nft_marketplace/presentation/widgets/discover_stack.dart';
import 'package:horizon/presentation/screens/nft_marketplace/presentation/widgets/history.dart';
import 'package:horizon/presentation/screens/nft_marketplace/presentation/widgets/nft_card.dart';
import 'package:horizon/presentation/screens/nft_marketplace/presentation/widgets/top_creators.dart';

class NftMarketplaceScreen extends StatelessWidget {
  const NftMarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    DiscoverStack(),
                    Row(
                      children: [
                        Text('Trending NFTs'),
                        Spacer(),
                        Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          spacing: 12,
                          children: [
                            CustomCard(bgColor: Theme.of(context).canvasColor, child: Text('Art')),
                            CustomCard(bgColor: Colors.transparent,child: Text('Music'),),
                            CustomCard(bgColor: Colors.transparent,child: Text('Collectibles')),
                            CustomCard(bgColor: Colors.transparent,child: Text('Sports')),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 370,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, state) {
                          return NFTCard();
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Text('Recently Added'),
                    SizedBox(
                      height: 370,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, state) {
                          return NFTCard();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  spacing: 24,
                  children: [
                    TopCreators(),
                    History(),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}

