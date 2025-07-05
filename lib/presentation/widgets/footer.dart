import 'package:flutter/material.dart';

import '../../config/theme/text_styles.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2022 Horizon UI. All Rights Reserved. Made with love by Simmmple!',
            style: medium.copyWith(fontSize: 14),
          ),
          Row(
            spacing: 42,
            children: [
              FooterOption(title: 'Marketplace',),
              FooterOption(title: 'License',),
              FooterOption(title: 'Terms of Use',),
              FooterOption(title: 'Blog',),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterOption extends StatelessWidget {
  const FooterOption({
    super.key, required this.title, this.onTap,
  });
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: medium.copyWith(fontSize: 14),
      ),
    );
  }
}