import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/utils/colors.dart';

TextStyle monserratStyle([Color? color, double fontSize = 20]) {
  return GoogleFonts.montserrat(
      color: color, fontSize: fontSize, fontWeight: FontWeight.bold);
}

TextStyle headingStyle([Color? color, double fontSize = 28]) {
  return GoogleFonts.rubikMoonrocks(
      color: color, fontSize: fontSize, fontWeight: FontWeight.bold);
}

TextStyle subheadingStyle([Color? color, double fontSize = 22]) {
  return GoogleFonts.signikaNegative(
      color: color, fontSize: fontSize, fontWeight: FontWeight.bold);
}

TextStyle normalStyle([Color? color, double fontSize = 20]) {
  return GoogleFonts.signikaNegative(
      color: color, fontSize: fontSize, fontWeight: FontWeight.w300);
}
