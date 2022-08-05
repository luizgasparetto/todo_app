import 'package:flutter/material.dart';

import '../../../tads_design_system.dart';

class TimePickerThemeMain {
  static TimePickerThemeData get theme {
    return TimePickerThemeData(
      backgroundColor: CustomColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: CustomColors.primary, width: 2),
      ),
      dayPeriodBorderSide: BorderSide(color: CustomColors.primary, width: 2),
      dayPeriodTextColor: CustomColors.primary,
      hourMinuteColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? CustomColors.primary
              : CustomColors.backgroundSelected),
      hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? Colors.white
              : CustomColors.primary),
      dialHandColor: Colors.blueGrey.shade700,
      dialBackgroundColor: CustomColors.backgroundSelected,
      hourMinuteTextStyle:
          const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      dayPeriodTextStyle:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      helpTextStyle: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(0),
      ),
      dialTextColor: MaterialStateColor.resolveWith((states) =>
          states.contains(MaterialState.selected)
              ? CustomColors.primary
              : Colors.white),
      entryModeIconColor: CustomColors.primary,
    );
  }
}
