import 'package:dartz/dartz.dart' as dartz;
import 'package:schedule_app/domain/repositories/task_repository.dart';

import '../entities/task.dart';

class GetAllTasks {
  final TaskRepository _taskRepository;

  GetAllTasks(this._taskRepository);

  Future<dartz.Either<String, List<Task>>> call() async {
    try {
      final tasks = await _taskRepository.getAll();
      return dartz.Right(tasks);
    } catch (_) {
      return const dartz.Left('No fue posible recuperar los datos');
    }
  }
}
