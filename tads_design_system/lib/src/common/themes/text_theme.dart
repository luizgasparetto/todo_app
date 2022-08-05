import 'package:flutter/material.dart';
import 'package:tads_design_system/src/common/common.dart';

class CustomTextTheme {
  static TextTheme get theme {
    return TextTheme(
      headline1: const TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
      headline2: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 21,
      ),
      headline3: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: CustomColors.secondaryTextColor,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      headline5: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      headline6: const TextStyle(
        color: Colors.white,
        fontSize: 11,
      ),
    );
  }
}
