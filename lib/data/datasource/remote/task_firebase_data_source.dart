import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:schedule_app/domain/entities/task.dart';

class TaskFirebaseDataSource {
  TaskFirebaseDataSource(this._firebaseFirestore);

  static const _pathTasks = "tasks";
  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<List<Task>> fetch() async {
    final querySnapshot = await _firebaseFirestore.collection(_pathTasks).get();
    print(querySnapshot);
    return [];
  }

  Future<void> create(Task task) async {
    await _firebaseFirestore.collection(_pathTasks).add({
      "description": task.description,
      "uuid": task.uuid,
      "photo": task.photo
    });
  }
}
