import 'package:flutter/material.dart';
import 'package:schedule_app/presentation/create_task/create_task_screen.dart';
import 'package:schedule_app/presentation/list_task/item_task.dart';

import '../../domain/entities/task.dart';
import '../../domain/use_cases/get_all_tasks.dart';
import '../../main.dart';

class ListTaskScreen extends StatefulWidget {
  const ListTaskScreen({Key? key}) : super(key: key);

  @override
  State<ListTaskScreen> createState() => _ListTaskScreenState();
}

class _ListTaskScreenState extends State<ListTaskScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: getAllTasks, child: Text('Refrescar lista')),
          Expanded(
            child: ListView(
              children: tasks.map((task) => ItemTask(task: task)).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateTaskScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void getAllTasks() async {
    final getAllTasks = GetAllTasks(taskRepositoryMemory);

    final result = await getAllTasks();

    result.fold((l) => null, (r) {
      setState(() {
        tasks = r;
      });
    });
  }
}
