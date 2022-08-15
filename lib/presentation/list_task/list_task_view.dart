import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_app/presentation/list_task/cubit/tasks_cubit.dart';
import 'package:schedule_app/presentation/list_task/item_task.dart';

class ListTaskView extends StatelessWidget {
  const ListTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<TasksCubit, TasksState>(
            builder: (context, state) {
              if (state is TasksSuccess) {
                return ListView(
                  children:
                      state.tasks.map((task) => ItemTask(task: task)).toList(),
                );
              }
              if (state is TasksFailure) {
                return Text('Error al obtener la data');
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }

  void getAllTasks(BuildContext context) async {
    BlocProvider.of<TasksCubit>(context).gotAllTask();
  }
}
