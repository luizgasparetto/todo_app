import 'package:core/shared/failures/i_app_exception.dart';
import 'package:core/translate/app_localizations.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

import 'package:tads_design_system/tads_design_system.dart';

import '../../../controllers/add_task_controller.dart';
import '../../../stores/add_task_store.dart';

class AddTaskPageWeb extends StatelessWidget {
  const AddTaskPageWeb({
    Key? key,
    required this.formKey,
    required this.controller,
    required this.datePicker,
    required this.timePicker,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final AddTaskController controller;
  final TADSCustomDateTime datePicker;
  final TADSCustomDateTime timePicker;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.06),
                TADSCustomTitlePainel(
                  title: AppLocalizations.of(context)!.addTaskTitle,
                  subtitle: AppLocalizations.of(context)!.addTaskSubtitle,
                ),
                SizedBox(height: size.height * 0.1),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TADSCustomPrefixLabel(
                        label: AppLocalizations.of(context)!.taskNameLabel,
                      ),
                      SizedBox(height: size.height * 0.01),
                      TADSCustomTextField(
                        label: AppLocalizations.of(context)!.taskNameField,
                        prefixIcon: IconlyLight.document,
                        onChanged: (value) => controller.task = value,
                        validate: (_) => controller.taskInstance.hasError(AppLocalizations.of(context)!.taskError),
                      ),
                      SizedBox(height: size.height * 0.015),
                      TADSCustomPrefixLabel(
                        label: AppLocalizations.of(context)!.taskDayLabel,
                      ),
                      SizedBox(height: size.height * 0.015),
                      datePicker,
                      SizedBox(height: size.height * 0.03),
                      TADSCustomPrefixLabel(
                        label: AppLocalizations.of(context)!.taskTimeLabel,
                      ),
                      SizedBox(height: size.height * 0.03),
                      timePicker,
                      SizedBox(height: size.height * 0.1),
                      TripleBuilder<AddTaskStore, IAppException, bool>(
                        store: controller.addTaskStore,
                        builder: (context, state) {
                          return TADSCustomButton(
                            text: AppLocalizations.of(context)!.createTask,
                            isLoading: state.isLoading,
                            width: 300,
                            onPressed: () {
                              if (formKey.currentState!.validate() && !state.isLoading) {
                                controller.addTask(
                                  AppLocalizations.of(context)!,
                                );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
