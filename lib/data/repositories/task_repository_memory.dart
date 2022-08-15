import 'package:schedule_app/domain/entities/task.dart';
import 'package:schedule_app/domain/repositories/task_repository.dart';

class TaskRepositoryMemory implements TaskRepository {
  List<Task> tasks = [];
  @override
  Future<void> create(Task task) async {
    tasks.add(task);
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
  Future<List<Task>> getAll() async {
    //await Future.delayed(Duration(seconds: 1));
    return tasks;
  }

  @override
  Future<void> update(Task task) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
