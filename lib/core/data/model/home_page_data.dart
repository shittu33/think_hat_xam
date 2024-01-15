import 'package:flutter/material.dart';

class HomePageData {
  final String label;
  final String icon;
  final Widget? page;

  const HomePageData({
    required this.label,
    required this.icon,
    this.page,
  });
}
