import 'package:core/core.dart';
import 'package:core/translate/app_localizations.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:todo_do_app/app/modules/home/presenter/controllers/home_controller.dart';
import 'package:tads_design_system/tads_design_system.dart';
import 'package:todo_do_app/app/modules/home/presenter/stores/states/task_state.dart';
import 'package:todo_do_app/app/modules/home/presenter/stores/task_store.dart';
import '../../widgets/list_tasks_shimmer_widget.dart';
import '../../widgets/tads_custom_dismissible.dart';

class HomePageWeb extends StatelessWidget {
  const HomePageWeb({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TADSCustomButtonWithIcon(
        icon: Icons.add,
        onPressed: () => Modular.to.pushNamed(AppRoutes.toAddTask),
        width: 60,
        isLoading: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: ScopedBuilder<AuthStore, IAppException, AuthState>(
              store: controller.authStore,
              onState: (context, state) {
                late final String name;
                if (state is AuthLoggedState) {
                  name = '${AppLocalizations.of(context)!.homePageTitle}${CustomString.ajustString(state.user.name)}';
                } else {
                  name = '\$ todoApp';
                }
                return Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
              },
            ),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: const Icon(IconlyLight.logout),
                onPressed: () => controller.logout(AppLocalizations.of(context)!),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16).copyWith(top: 4, bottom: 4),
              child: Column(
                children: [
                  TADSCustomTextField(
                    label: AppLocalizations.of(context)!.searchTask,
                    prefixIcon: IconlyLight.search,
                    onChanged: (text) => controller.getList(
                      searchText: text,
                      localizations: AppLocalizations.of(context)!,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(300).copyWith(top: 0, bottom: 0),
              child: ScopedBuilder<TaskStore, IAppException, TaskState>(
                store: controller.taskStore,
                onLoading: (context) => const ListTasksShimmerWidget(),
                onState: (context, state) {
                  if (state.tasks.isEmpty && state.completedTasks.isEmpty) {
                    return TADSNoItensCard(
                      title: AppLocalizations.of(context)!.noItensFound,
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 12),
                        child: Text(
                          '${AppLocalizations.of(context)!.tasks} - ${state.tasks.length}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      if (state.tasks.isEmpty)
                        ...[]
                      else ...[
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.tasks.length,
                          itemBuilder: (_, index) {
                            final task = state.tasks[index];
                            return TADSCustomDismissible(
                              task: task,
                              onTap: () => controller.updateCompletedList(task),
                              onDeleted: () => controller.deleteAnTaskItem(task),
                              onEdit: () => controller.gotoEditTask(task),
                            );
                          },
                        ),
                      ],
                      SizedBox(height: size.height * 0.01),
                      if (state.completedTasks.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.only(left: 12, bottom: 12),
                          child: Text(
                            '${AppLocalizations.of(context)!.completed} - ${state.completedTasks.length}',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.completedTasks.length,
                          itemBuilder: (_, index) {
                            final task = state.completedTasks[index];
                            return TADSCustomDismissible(
                              task: task,
                              onTap: () => controller.updateTasksList(
                                task,
                                AppLocalizations.of(context)!,
                              ),
                              onDeleted: () =>
                                  controller.deleteCompletedTaskItem(task),
                              onEdit: () => controller.gotoEditTask(task),
                            );
                          },
                        ),
                      ],
                      const SizedBox(height: kToolbarHeight),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
