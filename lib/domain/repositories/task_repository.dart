import 'package:schedule_app/domain/entities/task.dart';

abstract class TaskRepository {
  Future<void> create(Task task);
  Future<Task> find(String uuid);
  Future<List<Task>> getAll();
  Future<void> update(Task task);
  Future<void> delete(String uuid);
}
