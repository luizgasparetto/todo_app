import 'package:core/core.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:tads_design_system/tads_design_system.dart';
import 'package:todo_do_app/app/modules/home/presenter/controllers/home_controller.dart';
import '../../domain/dtos/create_task_dto.dart';
import '../../domain/usecases/create_task_usecase.dart';

class AddTaskStore extends StreamStore<IAppException, bool> {
  AddTaskStore(
    this._createTaskUsecase,
    this._overlayService,
    this._localNotificationService,
    this._homeController,
  ) : super(false);

  final ICreateTaskUsecase _createTaskUsecase;
  final IOverlayService _overlayService;
  final ILocalNotificationService _localNotificationService;
  final HomeController _homeController;

  Future<void> createTask(CreateTaskDTO params) async {
    setLoading(true);

    final isAfter = CustomTime.isAfter(DateTime.now(), params.deadlineAt);

    if (isAfter) {
      final result = await _createTaskUsecase(params);

      result.fold((l) {
        update(false);
        _overlayService.showErrorSnackBar(l.message);
        setLoading(false, force: true);
      }, (r) {
        if (!kIsWeb) {
          _localNotificationService.showNotification(
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
    } else {
      _overlayService.showErrorSnackBar('Deadline must be after now');
      setLoading(false, force: true);
    }
  }
}
