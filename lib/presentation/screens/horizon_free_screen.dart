import 'package:flutter/material.dart';
import 'package:horizon/presentation/screens/dashboard/presentation/dashboard_screen.dart';
import 'package:horizon/presentation/screens/nft_marketplace/presentation/nft_marketplace_screen.dart';

import '../../config/locator.dart';
import '../../config/navigation/navigation_service.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/sidebar.dart';

class HorizonFreeScreen extends StatelessWidget {
  const HorizonFreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: locator<NavigationService>(),
        builder: (context, child) => Row(
          children: [
            Sidebar(),
            Expanded(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: MediaQuery.of(context).size.width - 290,
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Header(),
                    Expanded(
                      child: _getBodyWidget(),
                    ),
                    Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _getBodyWidget() {
    switch (locator<NavigationService>().currentIndex) {
      case 0:
        return DashboardScreen();
      case 1:
        return NftMarketplaceScreen();
      default:
        return Center(
          child: Text(
            locator<NavigationService>().currentIndex.toString(),
          ),
        );
    }
  }

}



