import 'package:core/translate/app_localizations.dart';
import 'package:flutter/material.dart';

import 'package:tads_design_system/tads_design_system.dart';
import 'package:todo_do_app/app/modules/home/presenter/ui/pages/mobile/add_task_page_mobile.dart';

import '../controllers/add_task_controller.dart';
import 'pages/web/add_task_page_web.dart';

class AddTaskRedirector extends StatefulWidget {
  const AddTaskRedirector({Key? key, required this.controller}) : super(key: key);
  final AddTaskController controller;

  @override
  State<AddTaskRedirector> createState() => _AddTaskRedirectorState();
}

class _AddTaskRedirectorState extends State<AddTaskRedirector> {
  DateTime? _dateTime = DateTime.now();
  TimeOfDay? _time = TimeOfDay.now();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TADSRedirectorPage(
      mobilePage: AddTaskPageMobile(
        formKey: formKey,
        controller: widget.controller,
        datePicker: TADSCustomDatePicker(
          locale: AppLocalizations.of(context)!.localeName,
          onDateChange: (value) {
            setState(
              () => widget.controller.selectedDateValue = DateTime(
                value.year,
                value.month,
                value.day,
                widget.controller.selectedDateValue.hour,
                widget.controller.selectedDateValue.minute,
                widget.controller.selectedDateValue.second,
              ),
            );
          },
        ),
        timePicker: TADSCustomDateTime(
          validateText: AppLocalizations.of(context)!.validateTime,
          title: AppLocalizations.of(context)!.selectTime,
          onPressed: () => _timePicker(),
          label: _time != null ? CustomTime.ajustTime(_time!) : '',
        ),
      ),
      webPage: AddTaskPageWeb(
        formKey: formKey,
        controller: widget.controller,
        datePicker: TADSCustomDateTime(
          title: AppLocalizations.of(context)!.selectDay,
          validateText: AppLocalizations.of(context)!.validateTime,
          onPressed: () => _dateTimePicker(),
          label: _dateTime != null ? CustomTime.fullDate(_dateTime!) : '',
          isWeb: true,
        ),
        timePicker: TADSCustomDateTime(
          validateText: AppLocalizations.of(context)!.validateTime,
          title: AppLocalizations.of(context)!.selectTime,
          onPressed: () => _timePicker(),
          label: _time != null ? CustomTime.ajustTime(_time!) : '',
          isWeb: true,
        ),
      ),
    );
  }

  Future<void> _dateTimePicker() async {
    final time = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      initialDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    setState(() {
      if (time != null) {
        final date = DateTime(
          time.year,
          time.month,
          time.day,
          widget.controller.selectedDateValue.hour,
          widget.controller.selectedDateValue.minute,
        );
        widget.controller.selectedDateValue = date;
        _dateTime = date;
      }
    });
  }

  Future<void> _timePicker() async {
    TimeOfDay? time = await showTimePicker(
      cancelText: 'Close',
      confirmText: 'Confirm',
      context: context,
      initialTime: _time ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor: MaterialStateColor.resolveWith(
                  (states) => CustomColors.primary,
                ),
              ),
            ),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          ),
        );
      },
    );

    setState(() {
      if (time != null) {
        final date = DateTime(
          widget.controller.selectedDateValue.year,
          widget.controller.selectedDateValue.month,
          widget.controller.selectedDateValue.day,
          time.hour,
          time.minute,
        );
        widget.controller.selectedDateValue = date;
        _time = time;
      }
    });
  }
}
