part of 'tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksSuccess extends TasksState {
  final List<Task> tasks;
  TasksSuccess(this.tasks);
}

class TasksFailure extends TasksState {}
