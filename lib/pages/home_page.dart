import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/pages/portfolio_page.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/text_styles.dart';

import '../components/action_button.dart';
import '../components/column_row.dart';
import '../components/portfolio_title.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
  void openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      alignment: Alignment.center,
      child: ColumnOrRow(
        mainAxisSize: MainAxisSize.min,
        column: context.isMobile,
        children: [
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
                Text(
                  "Hello, It's Me",
                  style: monserratStyle(),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(name, style: headingStyle()),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("And I'm a ", style: monserratStyle()),
                    Expanded(
                      child: AnimatedTextKit(
                        animatedTexts: allRolles
                            .map((role) => TyperAnimatedText(
                                  role,
                                  textStyle: monserratStyle(accentColor),
                                ))
                            .toList(),
                        //totalRepeatCount: 4,
                        pause: const Duration(milliseconds: 1000),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  introMessage,
                  style: normalStyle(),
                  textAlign:
                      context.isMobile ? TextAlign.center : TextAlign.start,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    socialMediaIcons.length,
                    (index) => GestureDetector(
                      onTap: () {
                        openUrl(socialMedialinks[index]);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(4),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: accentColor)),
                        child: Icon(
                          socialMediaIcons[index],
                          color: accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                ActionButton(
                  text: "Download CV",
                  onTap: () {
                    openUrl(cvLink);
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.isMobile ? 20 : 0,
            width: !context.isMobile ? 20 : 0,
          ),
          CircleAvatar(
            radius: context.lowestSize.percentValue(20),
            backgroundImage: const AssetImage(profile),
          ),
        ],
      ),
    );
  }
}
