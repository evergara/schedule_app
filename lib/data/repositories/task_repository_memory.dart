import 'package:schedule_app/domain/entities/task.dart';
import 'package:schedule_app/domain/repositories/task_repository.dart';

class TaskRepositoryMemory implements TaskRepository{
  @override
  Future<void> create(Task task) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String uuid) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Task> find(String uuid) {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAll() async {
    return [
      Task('_description', '_uuid'),
      Task('_description2', '_uuid2')
    ];
  }

  @override
  Future<void> update(Task task) {
    // TODO: implement update
    throw UnimplementedError();
  }

}