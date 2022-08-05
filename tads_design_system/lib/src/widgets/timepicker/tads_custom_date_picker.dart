import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';

class TADSCustomDatePicker extends StatelessWidget {
  const TADSCustomDatePicker({Key? key, required this.locale, required this.onDateChange}) : super(key: key);

  final void Function(DateTime)? onDateChange;
  final String locale;

 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: DatePicker(
        DateTime.now(),
        locale: locale,
        initialSelectedDate: DateTime.now(),
        selectionColor: CustomColors.backgroundSelected,
        dayTextStyle: Theme.of(context).textTheme.headline6!,
        dateTextStyle: const TextStyle(color: Colors.white, fontSize: 23),
        monthTextStyle: Theme.of(context).textTheme.headline6!,
        selectedTextColor: Theme.of(context).primaryColor,
        onDateChange: onDateChange,
      ),
    );
  }
}
