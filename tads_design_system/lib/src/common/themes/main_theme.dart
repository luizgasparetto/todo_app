import 'package:flutter/material.dart';
import 'package:tads_design_system/src/common/themes/custom_colors.dart';
import 'package:tads_design_system/src/common/themes/text_theme.dart';
import 'package:tads_design_system/src/common/themes/time_picker_theme_data.dart';

class MainTheme {
  static ThemeData get theme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: CustomColors.backgroundSelected,
        iconColor: CustomColors.primary,
        collapsedIconColor: CustomColors.primary,
        expandedAlignment: Alignment.centerLeft,
      ),
      splashFactory: NoSplash.splashFactory,
      iconTheme: IconThemeData(color: CustomColors.primary),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: CustomColors.primary,
      ),
      hoverColor: Colors.transparent,
      timePickerTheme: TimePickerThemeMain.theme,
      primaryColor: CustomColors.primary,
      brightness: Brightness.dark,
      backgroundColor: CustomColors.background,
      scaffoldBackgroundColor: CustomColors.background,
      dialogBackgroundColor: CustomColors.secondaryDarkColor,
      unselectedWidgetColor: CustomColors.primary,
      textTheme: CustomTextTheme.theme,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.only(left: 20, bottom: 32),
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 154, 153, 158),
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.borderColor,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: CustomColors.borderColor,
            width: 3,
          ),
        ),
      ),
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: CustomColors.primary),
    );
  }
}
