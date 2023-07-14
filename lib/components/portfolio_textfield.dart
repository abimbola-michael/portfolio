// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';

import '../utils/colors.dart';

class PortfolioTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  final int maxlines;
  const PortfolioTextField({
    Key? key,
    required this.controller,
    required this.hint,
    this.inputType = TextInputType.text,
    this.maxlines = 1,
  }) : super(key: key);

  @override
  State<PortfolioTextField> createState() => _PortfolioTextFieldState();
}

class _PortfolioTextFieldState extends State<PortfolioTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: context.isDarkMode ? lightestWhite : lightestBlack,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: accentColor),
          ),
          hintText: widget.hint,
        ),
        keyboardType: widget.inputType,
        maxLines: widget.maxlines,
        minLines: widget.maxlines != 1 ? widget.maxlines : null,
      ),
    );
  }
}
