import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dimensions.dart';

var appColor = AppColors();
var appTheme = AppTheme();

class AppColors {
  AppColors();

  var primary = const Color(0xFF5B40AF);
  var accent = const Color(0xFFF68426);
  var yellow = const Color(0xFFFFD337);
  var backgroundDeep = const Color(0xFFFEEBDD);
  var transparent = Colors.transparent;
  var gray = const Color(0xFFB1B0B0);
  var black = const Color(0xFF010101);
  var blackGreen = const Color(0xFF010101);
  var blackMedium = const Color(0xFF303030);
  // var lightGray = const Color(0xFFD2D0D0);
  var lightGray = const Color(0xFFF1F6FB);
  var lightGray2 = const Color(0xFFE5F0FC);
  var background = const Color(0xFFEEEDED);
  var shadowGrey2 = const Color(0x112F2F2F);
  var darkGray = const Color(0xFF535252);
  var darkGray2 = const Color(0xFF646464);
  var darkGray3 = const Color(0xFF4E4E4E);
  var darkGray5 = const Color(0xFF737373);
  var transparentBlack = const Color(0xD8010101);
  var shadowGrey = const Color(0x232F2F2F);
  var success = const Color(0xFF43C084);
  var blue = const Color(0xFF379BF6);
  var white = const Color(0xFFFFFFFF);
  var red = Colors.red;
  var smallGradient = const LinearGradient(
      begin: Alignment(-0.9449995756149292, -1.0066247582435608),
      end: Alignment(-1.10259151458740234, 0.8449995756149292),
      // stops: [0.1,0.4,0.5],
      colors: [
        Color.fromRGBO(163, 0, 5, 1),
        Color.fromRGBO(47, 46, 52, 1),
      ]);

  var primaryGradient = const LinearGradient(
      begin: Alignment(-0.9449995756149292, -1.0066247582435608),
      end: Alignment(-1.10259151458740234, 0.8449995756149292),
      colors: [
        Color.fromRGBO(163, 0, 5, 1),
        Color.fromRGBO(47, 46, 52, 1),
      ]);

  var secondaryGradient = const LinearGradient(
      begin: Alignment(-0.3, -1),
      end: Alignment(-0.9, 6),
      colors: [
        Color.fromRGBO(163, 0, 5, 1),
        Color.fromRGBO(47, 46, 52, 1),
      ]);
}

var headline2Style =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: appColor.black);

var bodyText2Style = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: appColor.lightGray,
);

var textColor = appColor.blackGreen;

class AppTheme {
  var light = ThemeData(
    fontFamily: 'Inter',

    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: appColor.primary,
        systemStatusBarContrastEnforced: false,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    iconTheme: IconThemeData(color: appColor.black),
    primaryColor: appColor.primary,
    scaffoldBackgroundColor: appColor.white,
    drawerTheme: DrawerThemeData(
      backgroundColor: appColor.background,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: appColor.background,
      secondary: appColor.blackMedium,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      iconColor: appColor.accent,
      backgroundColor: appColor.white,

      textStyle: bodyText2Style.copyWith(color: appColor.accent),
    )),

    switchTheme: SwitchThemeData(
      trackColor: MaterialStateColor.resolveWith((states) => appColor.primary),
      thumbColor: MaterialStateColor.resolveWith((states) => appColor.white),
      //
      // splashRadius: 20
    ),
    tabBarTheme: TabBarTheme(
      labelColor: appColor.white,
      unselectedLabelColor: appColor.lightGray,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        color: appColor.accent,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: appColor.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
    radioTheme: RadioThemeData(
        fillColor:
            MaterialStateColor.resolveWith((states) => appColor.primary)),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    // ignore: prefer_const_constructors
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: textColor,
        letterSpacing: 1.2,
      ),
      headlineMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: textColor,
        letterSpacing: 0.8,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),

      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor.withOpacity(0.7),
      ),
      // bodyText1: ,
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      bodySmall: bodyText2Style,
      displayMedium: TextStyle(
        fontSize: 33,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: textColor,
      ),
      displaySmall: headline2Style,
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: textColor,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // contentPadding: const EdgeInsets.only(top: 12),
      isCollapsed: true,
      // contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      isDense: true,
      fillColor: appColor.background,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: appColor.black,
        ),
        borderRadius: BorderRadius.circular(
          Dims.searchInputRadius,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: appColor.black,
        ),
        borderRadius: BorderRadius.circular(
          Dims.searchInputRadius,
        ),
      ),
      hintStyle: TextStyle(
        color: appColor.blackMedium.withOpacity(0.6),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: TextStyle(
        color: appColor.blackMedium.withOpacity(0.6),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0,
          color: appColor.black,
        ),
        borderRadius: BorderRadius.circular(
          Dims.searchInputRadius,
        ),
      ),
    ),
  );
}
