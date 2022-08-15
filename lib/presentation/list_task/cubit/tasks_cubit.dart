import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:schedule_app/domain/entities/task.dart';
import 'package:schedule_app/domain/use_cases/get_all_tasks.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit(this._getAllTasks) : super(TasksInitial());

  final GetAllTasks _getAllTasks;

  gotAllTask() async {
    emit(TasksLoading());

    final result = await _getAllTasks();

    result.fold(
      (failure) => emit(TasksFailure()),
      (Stream<List<Task>> streamTask) async {
        await _subscribesStreamTasks(
          streamTask,
        );
      },
    );
  }

  _subscribesStreamTasks(
    Stream<List<Task>> streamTask,
  ) async {
    /*
    await emit.forEach<List<Task>>(
      streamTask,
      onData: (List<Task> tasks) {
        return TasksSuccess(tasks);
      },
      onError: (_, __) => TasksFailure(),
    );
    */
    streamTask.listen((tasks) {
      emit(TasksSuccess(tasks));
    });
  }
}
