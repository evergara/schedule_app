import 'package:dartz/dartz.dart' as dartz;
import 'package:schedule_app/domain/entities/task.dart';
import 'package:schedule_app/domain/repositories/task_repository.dart';
import '../../shared/nothing.dart';

class CreateTask {
  final TaskRepository _taskRepository;

  CreateTask(this._taskRepository);

  Future<dartz.Either<String, Nothing>> call(Task task) async {
    try {
      await _taskRepository.create(task);
      return dartz.Right(Nothing());
    } catch (_) {
      return const dartz.Left('Error al gurdar la tarea');
    }
  }
}
