// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/utils/text_styles.dart';

import '../utils/colors.dart';

class PortfolioTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  const PortfolioTitle({
    Key? key,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: context.isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: headingStyle(),
        ),
        const SizedBox(
          height: 10,
        ),
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: subheadingStyle(accentColor),
          ),
          const SizedBox(
            height: 10,
          ),
        ]
      ],
    );
  }
}
