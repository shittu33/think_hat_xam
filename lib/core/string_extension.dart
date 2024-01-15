import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

extension ResponsiveExtension on String {
  double get toDouble  {
    try {
      return double.parse(this);
    } catch (e) {
      log(e.toString());
    }
    return 0.0;
  }

  int get toInt {
    try {
      return int.parse(this);
    } catch (e) {
      log(e.toString());
    }
    return 0;
  }

  String get formatCurrencyNoZero {
    final currencyFormat = NumberFormat("#,##0.###", "en_US");

    num number = 0.0;
    try {
      number = num.parse(this);
    } catch (e) {
      Logger().i(e.toString());
    }
    return currencyFormat.format(number);
  }

  String get formatCurrency {
    final currencyFormat = NumberFormat("#,##0.##", "en_US");

    num number = 0.0;
    try {
      number = num.parse(this..replaceAll(',',''));
    } catch (e) {
      Logger().i(e.toString());
    }
    return currencyFormat.format(number);
  }

  String formatDateAndTime(
      {String? dateFormat = "dd/MM/yy",
      String? timeFormat = "hh:mmaa",
      plusDuration,
      minusDuration,
      String? separator = ' '}) {
    if (isEmpty) {
      return '';
    }

    try {
      var formattedDate = DateFormat(dateFormat).format(DateTime.parse(this));

      var formattedTime = DateFormat(timeFormat).format(DateTime.parse(this));
      if (plusDuration != null)
        formattedTime = DateFormat(timeFormat)
            .format(DateTime.parse(this).add(plusDuration));
      if (minusDuration != null)
        formattedTime = DateFormat(timeFormat)
            .format(DateTime.parse(this).subtract(minusDuration));
      return '$formattedDate$separator$formattedTime';
    } catch (e) {
      print(e);
    }
    return this;
  }
}
