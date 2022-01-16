import 'package:flutter/material.dart';
import 'colors.dart';


ThemeData appTheme = ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kWhite,
    primaryIconTheme: IconThemeData().copyWith(
      color: kPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: kWhite,
      elevation: 0,
      iconTheme: IconThemeData().copyWith(
        color: kPrimaryColor,
      ),
    ),
    iconTheme: IconThemeData().copyWith(
      color: kPrimaryColor,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: kBlack,
      ),
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: kBlack,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      button: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.25,
      ),
    ).apply(
      fontFamily: 'Poppins',
      bodyColor: kBlack,
    )
);
