import 'package:flutter/material.dart';
import 'package:schedule_app/di/di_container.dart';
import 'package:schedule_app/schedule_app.dart';

import 'data/repositories/task_repository_memory.dart';

Future<void> main() async {
  initDIContainer();
  runApp(const ScheduleApp());
  /*
  final getAllTasks = GetAllTasks(TaskRepositoryMemory());
  final tasks = await getAllTasks();
  print(tasks.length());
  **/
}
