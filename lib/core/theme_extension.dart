import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}