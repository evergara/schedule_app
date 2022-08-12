import 'package:flutter/material.dart';
import 'package:schedule_app/data/repositories/task_repository_memory.dart';
import 'package:schedule_app/schedule_app.dart';

import 'domain/use_cases/get_all_tasks.dart';

Future<void> main() async {
  runApp(const ScheduleApp());
  final getAllTasks = GetAllTasks(TaskRepositoryMemory());
  final tasks = await getAllTasks();

  print(tasks.length());
}
