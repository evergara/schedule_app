import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schedule_app/domain/entities/task.dart';
import 'package:schedule_app/domain/repositories/task_repository.dart';

import '../stream/tasks_stream_state.dart';

class TaskRepositoryFirebase implements TaskRepository {
  TaskRepositoryFirebase(this._firebaseFirestore);

  static const _pathTasks = "tasks";
  final FirebaseFirestore _firebaseFirestore;
  final tasksStreamState = TasksStreamState();

  @override
  Future<void> create(Task task) async {
    await _firebaseFirestore.collection(_pathTasks).add({
      "description": task.description,
      "uuid": task.uuid,
      "photo": task.photo
    });

    tasksStreamState.attach(task);
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
  Future<Stream<List<Task>>> getAll() async {
    final querySnapshot = await _firebaseFirestore.collection(_pathTasks).get();
    final tasks = querySnapshot.docs
        .map(
          (task) => Task(task.get("description"), task.get("uuid")),
        )
        .toList();

    return tasksStreamState.refresh(tasks);
  }

  @override
  Future<void> update(Task task) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
