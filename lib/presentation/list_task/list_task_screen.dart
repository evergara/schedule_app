import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/di/di_container.dart';
import 'package:schedule_app/presentation/create_task/create_task_screen.dart';
import 'package:schedule_app/presentation/list_task/cubit/tasks_cubit.dart';
import 'package:schedule_app/presentation/list_task/item_task.dart';
import 'package:schedule_app/presentation/list_task/list_task_view.dart';

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
    return BlocProvider(
      create: (context) => servicesLocator<TasksCubit>()..gotAllTask(),
      child: Scaffold(
          body: ListTaskView(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateTaskScreen(),
                  ));
            },
            child: const Icon(Icons.add),
          )),
    );
  }
}
