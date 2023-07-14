import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  bool get isDarkMode {
    return MediaQuery.of(this).platformBrightness == Brightness.dark;
  }

  bool get isMobile => MediaQuery.of(this).size.width < 730;
  bool get isTablet {
    var width = MediaQuery.of(this).size.width;
    return width < 1190 && width >= 730;
  }

  bool get isWeb => MediaQuery.of(this).size.width >= 1190;
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
  //bool get isPortrait => screenWidth < screenHeight;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get lowestSize =>
      screenWidth < screenHeight ? screenWidth : screenHeight;
  double get highestSize =>
      screenWidth > screenHeight ? screenWidth : screenHeight;
  // Size get screenSize => MediaQuery.of(this).size;
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  double screenHeightPercentage(int percent) => screenHeight * percent / 100;
  double screenWidthPercentage(int percent) => screenWidth * percent / 100;
  double adaptiveTextSize(double size) => (size / 720) * screenHeight;
}

extension DoubleExtensions on double {
  int get toDegrees => (this * (180.0 / 3.14159265)).toInt();
  double percentValue(int percent) => this * percent / 100;
}
