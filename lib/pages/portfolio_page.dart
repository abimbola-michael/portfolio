import 'package:flutter/material.dart';
import 'package:portfolio/components/appbar_button.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/pages/pages.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  int currentPage = 0;
  late ScrollController _controller;
  // final ItemScrollController _controller = ItemScrollController();
  // final ItemPositionsListener itemPositionsListener =
  //     ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    //itemPositionsListener.itemPositions.addListener(() {});

    _controller = ScrollController();
    _controller.addListener(() {
      final page = _controller.offset ~/ context.screenHeight;
      if (page != currentPage) {
        setState(() {
          currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> widgets = const [
    HomePage(),
    AboutPage(),
    SkillsPage(),
    ProjectsPage(),
    ContactPage(),
  ];
  void scrollToPosition(int index) {
    _controller.animateTo(index * context.screenHeight,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    setState(() {
      currentPage = index;
    });
    // _controller.scrollTo(
    //     index: index,
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      appBar: AppBar(
        title: const Text("Portfolio"),
        actions: context.isMobile
            ? null
            : List.generate(
                actions.length,
                (index) => AppbarButton(
                    index: index,
                    selected: currentPage == index,
                    onTap: () {
                      scrollToPosition(index);
                      setState(() {
                        currentPage = index;
                      });
                    }),
              ),
      ),
      endDrawer: !context.isMobile
          ? null
          : Drawer(
              child: ListView(
                children: List.generate(
                  actions.length,
                  (index) => AppbarButton(
                      index: index,
                      selected: currentPage == index,
                      onTap: () {
                        Navigator.of(context).pop();
                        scrollToPosition(index);
                      }),
                ),
              ),
            ),
      // body: ScrollablePositionedList.builder(
      //   itemCount: actions.length,
      //   scrollDirection: Axis.vertical,
      //   itemScrollController: _controller,
      //   itemPositionsListener: itemPositionsListener,
      //   //controller: _controller,
      //   itemBuilder: (context, index) {
      //     return Container(
      //       alignment: Alignment.center,
      //       width: context.screenWidth,
      //       child: widgets[index],
      //     );
      //   },
      //   padding:
      //       EdgeInsets.symmetric(horizontal: context.screenWidthPercentage(5)),
      // ),
      body: ListView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        padding:
            EdgeInsets.symmetric(horizontal: context.screenWidthPercentage(5)),
        children: List.generate(
          actions.length,
          (index) => Container(
            alignment: Alignment.center,
            width: context.screenWidth,
            height: context.screenHeight,
            child: widgets[index],
          ),
        ),
      ),
      floatingActionButton: currentPage == 0
          ? null
          : FloatingActionButton(
              backgroundColor: accentColor,
              onPressed: () {
                scrollToPosition(0);
              },
              child: const Icon(Icons.keyboard_arrow_up_rounded),
            ),
    );
  }
}
