import 'package:core/shared/helpers/debouncer.dart';
import 'package:core/shared/stores/connection_store.dart';
import 'package:core/translate/app_localizations.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tads_design_system/tads_design_system.dart';
import 'package:todo_do_app/app/modules/home/presenter/controllers/home_controller.dart';
import 'package:todo_do_app/app/modules/home/presenter/stores/task_store.dart';
import 'package:todo_do_app/app/modules/home/presenter/ui/pages/mobile/home_page_mobile.dart';
import 'package:todo_do_app/app/modules/home/presenter/ui/pages/web/home_page_web.dart';

class HomeRedirector extends StatefulWidget {
  const HomeRedirector({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  State<HomeRedirector> createState() => _HomeRedirectorState();
}

class _HomeRedirectorState extends State<HomeRedirector> {
  TaskStore get store => widget.controller.taskStore;
  final ConnectionStore connectionStore = Modular.get<ConnectionStore>();
  late final Disposer taskStoreDisposer;
  late final Disposer storeDisposer;

  @override
  void initState() {
    super.initState();
    taskStoreDisposer = store.observer();
    storeDisposer = connectionStore.observer(
      onState: (state) {
        if (state.hasConnection) {
          Debouncer(milliseconds: 1000).run(() {
            if (mounted) {
              widget.controller.syncTask(AppLocalizations.of(context)!);
            }
          });
        }
      },
    );
    _getListTasks();
  }

  Future<void> _getListTasks() async {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      widget.controller.getList(localizations: AppLocalizations.of(context)!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TADSRedirectorPage(
      mobilePage: HomePageMobile(controller: widget.controller, connectionStore: connectionStore),
      webPage: HomePageWeb(controller: widget.controller),
    );
  }

  @override
  void dispose() {
    storeDisposer();
    taskStoreDisposer();
    super.dispose();
  }
}
