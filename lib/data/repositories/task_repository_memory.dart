import 'package:schedule_app/data/stream/tasks_stream_state.dart';
import 'package:schedule_app/domain/entities/task.dart';
import 'package:schedule_app/domain/repositories/task_repository.dart';

class TaskRepositoryMemory implements TaskRepository {
  final tasksStreamState = TasksStreamState();

  @override
  Future<void> create(Task task) async {
    tasksStreamState.attach(task);
  }

  @override
  Future<void> delete(String uuid) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Task> find(String uuid) async {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  Future<Stream<List<Task>>> getAll() async {
    //await Future.delayed(Duration(seconds: 1));
    return tasksStreamState.streamEntities;
  }

  @override
  Future<void> update(Task task) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
