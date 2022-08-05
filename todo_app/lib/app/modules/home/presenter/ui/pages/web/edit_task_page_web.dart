import 'package:core/core.dart';
import 'package:core/translate/app_localizations.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

import 'package:tads_design_system/tads_design_system.dart';

import '../../../../domain/entities/task_entity.dart';
import '../../../controllers/edit_task_controller.dart';
import '../../../stores/edit_task_store.dart';

class EditTaskPageWeb extends StatelessWidget {
  const EditTaskPageWeb({
    Key? key,
    required this.formKey,
    required this.controller,
    required this.datePicker,
    required this.timePicker,
    required this.taskEntity,
  }) : super(key: key);
  
  final GlobalKey<FormState> formKey;
  final EditTaskController controller;
  final TADSCustomDateTime datePicker;
  final TADSCustomDateTime timePicker;
  final TaskEntity taskEntity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                TADSCustomTitlePainel(
                  title: AppLocalizations.of(context)!.editTask,
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
                        initialValue: taskEntity.name,
                        prefixIcon: IconlyLight.document,
                        onChanged: (value) => controller.task = value,
                        validate: (_) => controller.taskInstance
                            .hasError(AppLocalizations.of(context)!.taskError),
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
                      TripleBuilder<EditTaskStore, IAppException, bool>(
                        store: controller.editTaskStore,
                        builder: (context, state) {
                          return TADSCustomButton(
                            text: AppLocalizations.of(context)!.editTask,
                            isLoading: state.isLoading,
                            width: 300,
                            onPressed: () {
                              if (formKey.currentState!.validate() &&
                                  !state.isLoading) {
                                controller.editTask(
                                  taskEntity.id,
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
