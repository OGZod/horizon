import 'package:flutter/material.dart';
import 'package:horizon/config/theme/text_styles.dart';
import 'package:horizon/core/presentation/widgets/icons/horizon_icon.dart';

import '../../../../../config/theme/app_colors.dart';

class DashBoardSmallCard extends StatelessWidget {
  const DashBoardSmallCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.body,
    this.icon,
    this.iconBg,
  });

  final String title;
  final String body;
  final String? subtitle;
  final String? icon;
  final Color? iconBg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      width: 191,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            CircleAvatar(
              backgroundColor: iconBg,
              radius: 24,
              child: HorizonIcon(icon!),
            ),
          Column(
            spacing: 3,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: medium.copyWith(color: cardText, fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
              Text(body, style: bold.copyWith(fontSize: 24)),
              if (subtitle != null)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '+23% ',
                        style: bold.copyWith(
                          color: Color(0xff01B574),
                          fontSize: 10,
                        ),
                      ),
                      TextSpan(
                        text: subtitle,
                        style: regular.copyWith(fontSize: 10, color: cardText),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.child, this.bgColor});

  final Widget child;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).canvasColor,
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      child: child,
    );
  }
}

class LargeCard extends StatelessWidget {
  const LargeCard({
    super.key,
    required this.child,
    this.height,
    this.hasPadding = true,
  });

  final Widget child;
  final double? height;
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 300,
      padding: hasPadding?EdgeInsets.all(24):EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardColor,
      ),
      child: child,
    );
  }
}
