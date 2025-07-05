import 'package:flutter/material.dart';
import 'package:horizon/config/theme/app_colors.dart';
import 'package:horizon/config/theme/text_styles.dart';

class UpgradeProCard extends StatelessWidget {
  final VoidCallback? onTap;

  const UpgradeProCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 224,
      width: 228,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 190,
              width: 228,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff868CFF), Color(0xff4318FF)],
                ),
                borderRadius: BorderRadiusGeometry.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  SizedBox(height: 12,),
                  Text('Upgrade to PRO', style: bold),
                  Text(
                    'to get access to all features! Connect with Venus World! ',
                    textAlign: TextAlign.center,
                    style: regular.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 94,
              width: 94,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: card, width: 8),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff868CFF), Color(0xff4318FF)],
                ),
              ),
              child: Image.asset('assets/icons/horizon_logo.png'),
            ),
          ),
        ],
      ),
    );
  }
}
