import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:portfolio/components/skills_card.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/pages/portfolio_page.dart';
import 'package:portfolio/utils/assets.dart';
import 'package:portfolio/utils/constants.dart';

import '../components/column_row.dart';
import '../components/custom_gridview.dart';
import '../components/portfolio_title.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  @override
  Widget build(BuildContext context) {
    int crossAxisCount = context.isMobile
        ? 1
        : context.isTablet
            ? 2
            : 3;
    return Container(
      height: context.screenHeight,
      width: context.screenWidth,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const PortfolioTitle(
            title: "My Skills",
          ),
          // Column(
          //   mainAxisSize: MainAxisSize.max,
          //   children: children,
          // )
          CustomGridView(
            itemsMainAxisAlignment: MainAxisAlignment.spaceEvenly,
            itemsMainAxisSize: MainAxisSize.max,
            items: skills,
            gridSize: crossAxisCount,
            itemBuilder: (index) {
              return SkillsCard(skill: skills[index]);
            },
          )
        ],
      ),
    );
  }
}
