import 'package:flutter/material.dart';
import 'package:portfolio/components/projects_card.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/action_button.dart';
import '../components/circle_button.dart';
import '../components/custom_gridview.dart';
import '../components/portfolio_title.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  int currentPos = 0;
  int crossAxisCount = 1;

  late ScrollController controller;

  void openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      final index = controller.offset ~/
          ((context.screenWidth - context.screenWidthPercentage(30)));
      //print("page = $index");
      if (index != currentPos) {
        setState(() {
          currentPos = index;
        });
      }
    });
  }

  void scrollToPosition(bool next) {
    int crossAxisCount = context.isMobile
        ? 1
        : context.isTablet
            ? 2
            : 3;
    final page = currentPos;
    if ((!next && page == 0) || (next && page == projects.length - 1)) return;
    final newPage = next ? page + 1 : page - 1;
    controller.animateTo(
        newPage * ((context.screenWidth - context.screenWidthPercentage(15))),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn);
    setState(() {
      currentPos = page;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = context.isMobile
        ? 1
        : context.isTablet
            ? 2
            : 3;
    return Container(
      height: context.screenHeight,
      //  height: context.isWeb ? context.screenHeight : context.screenHeight * 3,
      width: context.screenWidth,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const PortfolioTitle(
            title: "My Projects",
          ),
          Stack(
            children: [
              CustomGridView(
                scrollable: true,
                scrollController: controller,
                axis: Axis.horizontal,
                items: projects,
                gridSize: 2,
                itemBuilder: (index) {
                  final project = projects[index];
                  return GestureDetector(
                    child: ProjectsCard(project: project),
                    onTap: () {
                      if (project.url != "") {
                        openUrl(project.url);
                      }
                    },
                  );
                },
              ),
              if (currentPos != 0) ...[
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  child: CircleButton(
                    icon: Icons.arrow_back_ios_rounded,
                    onTap: () {
                      scrollToPosition(false);
                    },
                  ),
                ),
              ],
              if (currentPos != (projects.length / 2) - crossAxisCount) ...[
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: CircleButton(
                    icon: Icons.arrow_forward_ios_rounded,
                    onTap: () {
                      scrollToPosition(true);
                    },
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
