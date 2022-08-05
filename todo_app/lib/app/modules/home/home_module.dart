import 'package:dependency_module/dependency_module.dart';
import 'package:todo_do_app/app/modules/home/domain/entities/task_entity.dart';
import 'package:todo_do_app/app/modules/home/presenter/controllers/home_controller.dart';

import 'domain/usecases/create_task_usecase.dart';
import 'domain/usecases/delete_task_usecase.dart';
import 'domain/usecases/edit_task_usecase.dart';
import 'domain/usecases/get_list_tasks_usecase.dart';
import 'external/datasources/task_local_datasource_impl.dart';
import 'external/datasources/task_remote_datasource_impl.dart';
import 'infra/repositories/task_repository_impl.dart';
import 'presenter/controllers/add_task_controller.dart';
import 'presenter/controllers/edit_task_controller.dart';
import 'presenter/stores/add_task_store.dart';
import 'presenter/stores/edit_task_store.dart';
import 'presenter/stores/task_store.dart';
import 'presenter/ui/add_task_redirector.dart';
import 'presenter/ui/edit_task_redirector.dart';
import 'presenter/ui/home_redirector.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //Datasources
        Bind.factory((i) => TaskRemoteDatasourceImpl(i())),
        Bind.factory((i) => TaskLocalDatasourceImpl(i(), i(), i())),
        //Repositories
        Bind.factory((i) => TaskRepositoryImpl(i(), i(), i())),
        //Usecases
        Bind.factory((i) => GetListTasksUsecaseImpl(i())),
        Bind.factory((i) => EditTaskUsecaseImpl(i())),
        Bind.factory((i) => DeleteTaskUsecaseImpl(i())),
        Bind.factory((i) => CreateTaskUsecaseImpl(i())),
        //Stores
        Bind.singleton((i) => TaskStore()),
        Bind.factory((i) => EditTaskStore(i(), i(), i(), i())),
        Bind.factory(
          (i) => AddTaskStore(i(), i(), i(), i()),
        ),
        // Controllers
        Bind.factory((i) => AddTaskController(i())),
        Bind.factory((i) => EditTaskController(i())),
        Bind.factory((i) => HomeController(i(), i(), i(), i(), i(), i(), i(), i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, __) => HomeRedirector(
            controller: context.read<HomeController>(),
          ),
        ),
        ChildRoute(
          '/add-task',
          child: (context, _) => AddTaskRedirector(
            controller: context.read<AddTaskController>(),
          ),
        ),
        ChildRoute(
          '/edit-task',
          child: (context, args) => EditTaskRedirector(
            controller: context.read<EditTaskController>(),
            taskEntity: args.data as TaskEntity,
          ),
        ),
      ];
}
