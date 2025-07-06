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
          Expanded(
            flex: 1,
            child: Text(
              '© 2022 Horizon UI. All Rights Reserved. Made with love by Simmmple!',
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: medium.copyWith(fontSize: 14),
            ),
          ),
          SizedBox(width: 24,),
          Expanded(
            flex: 1,
            child: Wrap(
              spacing: 16,
              alignment: WrapAlignment.spaceEvenly,
              children: [
                FooterOption(title: 'Marketplace',),
                FooterOption(title: 'License',),
                FooterOption(title: 'Terms of Use',),
                FooterOption(title: 'Blog',),
              ],
            ),
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