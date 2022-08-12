import 'package:flutter/material.dart';
import 'package:schedule_app/schedule_app.dart';

import 'data/repositories/task_repository_memory.dart';

final taskRepositoryMemory = TaskRepositoryMemory();
Future<void> main() async {
  runApp(const ScheduleApp());
  /*
  final getAllTasks = GetAllTasks(TaskRepositoryMemory());
  final tasks = await getAllTasks();
  print(tasks.length());
  **/
}
