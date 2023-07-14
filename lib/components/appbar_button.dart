// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';

class AppbarButton extends StatefulWidget {
  final int index;
  final bool selected;
  final void Function() onTap;
  const AppbarButton({
    Key? key,
    required this.index,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AppbarButton> createState() => _AppbarButtonState();
}

class _AppbarButtonState extends State<AppbarButton> {
  bool hovering = false;
  @override
  Widget build(BuildContext context) {
    // return InkWell(
    //   onHover: (hover) {
    //     setState(() {
    //       this.hover = hover;
    //     });
    //   },
    //   //hoverColor: accentColor,
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
    //     child: Text(
    //       actions[widget.index],
    //       style: TextStyle(
    //           color: widget.selected || hover ? accentColor : Colors.black,
    //           fontWeight: FontWeight.bold,
    //           fontSize: 20),
    //     ),
    //   ),
    // );
    return MouseRegion(
      // hoverColor: accentColor,
      // onPressed: () {
      //   widget.onTap();
      // },
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
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: hovering ? accentColor : Colors.transparent,
          ),
          child: Text(
            actions[widget.index],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: widget.selected && !hovering ? accentColor : null,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
