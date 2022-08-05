import 'package:core/core.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:todo_do_app/app/modules/home/presenter/controllers/home_controller.dart';

import 'package:tads_design_system/tads_design_system.dart';

import '../../domain/dtos/edit_task_dto.dart';
import '../../domain/usecases/edit_task_usecase.dart';

class EditTaskStore extends StreamStore<IAppException, bool> {
  EditTaskStore(
    this._editTaskUsecase,
    this._overlayService,
    this._localNotificationService,
    this._homeController,
  ) : super(false);
  final IEditTaskUsecase _editTaskUsecase;
  final IOverlayService _overlayService;
  final ILocalNotificationService _localNotificationService;
  final HomeController _homeController;

  Future<void> editTask(EditTaskDTO params) async {
    setLoading(true);
    if (CustomTime.isBefore(DateTime.now(), params.deadlineAt)) {
      _overlayService
          .showErrorSnackBar('Deadline date must be after current date');
      setLoading(false, force: true);
      update(false);
    } else {
      final result = await _editTaskUsecase(params);
      result.fold((l) {
        update(false);
        _overlayService.showErrorSnackBar(l.message);
        setLoading(false, force: true);
      }, (r) {
        if (!kIsWeb) {
          _localNotificationService.replaceANotification(
            ShowLocalNotificationDTO(
              id: r.id,
              title: '${params.localizations!.notificationTitle} ${r.name}',
              endDate: r.deadlineAt,
              body: params.localizations!.notificationBody,
              secondBody: params.localizations!.notificationSecondBody,
            ),
          );
        }
        _homeController.getList(localizations: params.localizations!);
        Modular.to.pushReplacementNamed(AppRoutes.toHome);
        update(true);
      });
    }
  }
}
