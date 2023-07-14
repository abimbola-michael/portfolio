import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/pages/portfolio_page.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/text_styles.dart';

import '../components/column_row.dart';
import '../components/portfolio_title.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      alignment: Alignment.center,
      child: ColumnOrRow(
        mainAxisSize: MainAxisSize.min,
        column: context.isMobile,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // CircleAvatar(
          //   radius: context.lowestSize.percentValue(30),
          //   backgroundImage: const AssetImage(profile),
          // ),
          // SizedBox(
          //   height: context.isMobile ? 20 : 0,
          //   width: !context.isMobile ? 20 : 0,
          // ),
          Container(
            constraints: context.isMobile
                ? null
                : BoxConstraints(maxWidth: context.screenWidthPercentage(50)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: context.isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                const PortfolioTitle(
                  title: "About Me",
                  subtitle: jobRole,
                ),
                Text(
                  aboutMe,
                  style: normalStyle(null, context.isMobile ? 16 : 20),
                  textAlign:
                      context.isMobile ? TextAlign.center : TextAlign.start,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
