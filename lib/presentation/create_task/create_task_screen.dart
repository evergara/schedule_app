import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/data/datasource/remote/task_firebase_data_source.dart';
import 'package:schedule_app/data/repositories/task_repository_memory.dart';
import 'package:schedule_app/di/di_container.dart';
import 'package:schedule_app/domain/entities/task.dart';
import 'package:schedule_app/domain/repositories/task_repository.dart';
import 'package:schedule_app/domain/use_cases/create_task.dart';
import 'package:schedule_app/domain/use_cases/get_all_tasks.dart';
import 'package:uuid/uuid.dart';

import '../../main.dart';

class CreateTaskScreen extends StatelessWidget {
  CreateTaskScreen({Key? key}) : super(key: key);

  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar tarea'),
      ),
      body: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Description'))
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () => createTask(context), child: Text('Registrar'))
        ],
      ),
    );
  }

  void createTask(BuildContext context) async {
    final createTaskUseCase = servicesLocator<CreateTask>();
    final task = Task(descriptionController.text, const Uuid().v4());
    await createTaskUseCase(task);
  }
}
