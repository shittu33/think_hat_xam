import 'package:flutter/material.dart';

class Responsive {
  static const posSize = 360.0;
  static const averageScreen = 400;
  static const smallerSize = 600;
  static const smallSize = 800;
  static const largeSize = 980;
  static const extraLargeSize = 1200;


  static bool isPosSize(BuildContext context) {
    return MediaQuery.of(context).size.width <= posSize;
  }

  static bool isAverageSize(BuildContext context) {
    return MediaQuery.of(context).size.width <= averageScreen;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > largeSize &&
        MediaQuery.of(context).size.width < extraLargeSize;
  }

  //Large screen is any screen whose width is more than 1200 pixels
  static bool isExtraLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > extraLargeSize;
  }

//Small screen is any screen whose width is less than 800 pixels
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < smallSize &&MediaQuery.of(context).size.width >smallerSize;
  }

  static bool isSmallerScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < smallerSize;
  }

//Medium screen is any screen whose width is less than 1200 pixels,
  //and more than 800 pixels
  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > smallSize &&
        MediaQuery.of(context).size.width < largeSize;
  }
}

extension ResponsiveExtension on BuildContext {
  bool get isLargeScreen => Responsive.isLargeScreen(this);
  bool get isExtraLargeScreen => Responsive.isExtraLargeScreen(this);
  bool get isSmallScreen => Responsive.isSmallScreen(this);
  bool get isMediumScreen => Responsive.isMediumScreen(this);
  bool get isSmallerScreen => Responsive.isSmallerScreen(this);
  bool get isPosSize => Responsive.isPosSize(this);
  Orientation get deviceOrientation => MediaQuery.of(this).orientation;
  Size get screenSize => MediaQuery.of(this).size;
  bool get isLandscape => deviceOrientation == Orientation.landscape;
  bool get isPortrait => deviceOrientation == Orientation.portrait;
}
