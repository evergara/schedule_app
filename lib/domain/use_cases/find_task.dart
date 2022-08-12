import '../entities/task.dart';
import '../repositories/task_repository.dart';
import 'package:dartz/dartz.dart' as dartz;

class FindTask {
  final TaskRepository _taskRepository;

  FindTask(this._taskRepository);

  Future<dartz.Either<String, Task>> call(String uuid) async {
    try {
      final task = await _taskRepository.find(uuid);
      return dartz.Right(task);
    } catch (_) {
      return const dartz.Left('No fue posible recuperar la data');
    }
  }
}
