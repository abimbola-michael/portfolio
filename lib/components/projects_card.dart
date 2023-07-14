// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/components/custom_gridview.dart';

import 'package:portfolio/extensions.dart';
import 'package:portfolio/utils/colors.dart';

import '../models/project.dart';
import '../utils/text_styles.dart';

class ProjectsCard extends StatefulWidget {
  final Project project;
  const ProjectsCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<ProjectsCard> createState() => _ProjectsCardState();
}

class _ProjectsCardState extends State<ProjectsCard> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    int crossAxisCount = context.isMobile
        ? 1
        : context.isTablet
            ? 2
            : 3;
    return MouseRegion(
      onHover: (event) {
        setState(() {
          hovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          hovering = false;
        });
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          height: context.screenHeightPercentage(40),
          width: (context.screenWidth - context.screenWidthPercentage(15)) /
              crossAxisCount,
          decoration: BoxDecoration(
            color: context.isDarkMode ? lightestWhite : lightestBlack,
            //image: DecorationImage(image: AssetImage(url),),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CustomGridView(
                  expanded: true,
                  items: widget.project.images,
                  gridSize: 2,
                  itemBuilder: (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            widget.project.images[index],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  }),
              if (hovering) ...[
                Container(
                  color: lighterBlack,
                  width: double.infinity,
                  height: context.screenHeightPercentage(20),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.project.title,
                        style: monserratStyle(
                            Colors.white, context.isMobile ? 18 : 20),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.project.description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
