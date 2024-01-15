import 'dart:math';

import 'package:flutter/material.dart';

class Dims {
  const Dims._();

  // the app was designed on an iphone XR frame with w:h = 375:812
  static Size designSize = const Size(375, 812);

  // the device [running the application] size
  static late Size deviceSize;

  static const canvasHeight = 812;
  static const canvasWidth = 375;
  static const double appBarTopGap = 69;
  static const double appBodyTopGap = 35;

  static const double buttonRadius = 25;
  static const double imageRadius = 8;
  static const double widgetBorderRadius = 34;

  static const appSideGap = 24.0;
  static const averterSideGap = 10.0;
  static const appSidePercentage = 0.064;

  static double searchInputRadius = 28;
  static const double appVertGap = 10;
  static const double cardVertGap = 14;

  /// get the screen percentage
  /// [context] Widget screen context
  /// [value] the value between 0 and 1
  /// to be coverted to percentage
  ///
  /// e.g 0.6 is converted to 60%
  ///
  static double getHeightPagePercentage(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }

  static double getWidthPercentage(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * value;
  }

  /// used to set the deviceSize during the application startup process
  static void setSize(MediaQueryData media) {
    deviceSize = Size(
      // media.size.width - (media.padding.left + media.padding.right),
      // media.size.height - (media.padding.top + media.padding.bottom),
      media.size.width,
      media.size.height,
    );
  }

  /// naive implementation
  static double quotient(double dim1, double dim2) {
    return dim1 > dim2 ? dim1 / dim2 : dim2 / dim1;
  }

  /// horizontal[width] quotient
  static double dxQuotient() {
    final quotient = deviceSize.width / designSize.width;

    return quotient;
  }

  /// vertical[height] quotient
  static double dyQuotient() {
    final quotient = deviceSize.height / designSize.height;

    return quotient;
  }

  /// give horizontal spacing in percentages in respect to device width
  static double dxPercent(num extent) {
    return deviceSize.width * extent;
  }

  /// give vertical spacing in percentages in respect to device height
  static double dyPercent(num extent) {
    return deviceSize.height * extent;
  }

  /// give responsive horizontal spacing [value is calculated based on device size and design size]
  static double dx(num x) {
    final quotient = dxQuotient();

    return quotient * x;
  }

  /// give responsive vertical spacing [value is calculated based on device size and design size]
  static double dy(num x) {
    final quotient = dyQuotient();

    return quotient * x;
  }

  /// give responsive font sizes [based on device size and design size]
  static double sp(num x) {
    final dxQuotientValue = dxQuotient();
    final dyQuotientValue = dyQuotient();
    final ratio = min(dxQuotientValue, dyQuotientValue);

    return ratio * x;
  }
}

extension DimsExtension on num {
  // horizontal spacing
  double get dx => Dims.dx(this);
  // vertical spacing
  double get dy => Dims.dy(this);
  // vertical spacing [in percentage]
  double get dyPercent => Dims.dyPercent(this);
  // horizontal spacing [in percentage]
  double get dxPercent => Dims.dxPercent(this);
  // font size
  double get sp => Dims.sp(this);
}
