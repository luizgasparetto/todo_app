import 'package:core/core.dart';
import 'package:core/translate/app_localizations.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:todo_do_app/app/modules/home/domain/entities/task_entity.dart';
import 'package:todo_do_app/app/modules/home/presenter/controllers/edit_task_controller.dart';

import 'package:tads_design_system/tads_design_system.dart';

import '../../../stores/edit_task_store.dart';

class EditTaskPageMobile extends StatelessWidget {
  const EditTaskPageMobile({
    Key? key,
    required this.formKey,
    required this.controller,
    required this.datePicker,
    required this.timePicker,
    required this.taskEntity,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final EditTaskController controller;
  final TADSCustomDatePicker datePicker;
  final TADSCustomDateTime timePicker;
  final TaskEntity taskEntity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Modular.to.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TADSCustomTitlePainel(
                  title: AppLocalizations.of(context)!.editTask,
                  subtitle: AppLocalizations.of(context)!.addTaskSubtitle,
                ),
                SizedBox(height: size.height * 0.1),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      SizedBox(child: datePicker),
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
