import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_app/data/repositories/task_repository_firebase.dart';
import 'package:schedule_app/data/repositories/task_repository_memory.dart';
import 'package:schedule_app/domain/repositories/task_repository.dart';
import 'package:schedule_app/presentation/list_task/cubit/tasks_cubit.dart';
import 'package:schedule_app/domain/use_cases/use_cases.dart';

final servicesLocator = GetIt.instance;

void initDIContainer() {
  servicesLocator.registerFactory(() => TasksCubit(servicesLocator()));
  servicesLocator.registerLazySingleton(
      () => GetAllTasks(servicesLocator(instanceName: 'MemoryUno')));
  servicesLocator.registerLazySingleton(
      () => CreateTask(servicesLocator(instanceName: 'MemoryUno')));
  servicesLocator.registerLazySingleton(
      () => FindTask(servicesLocator(instanceName: 'MemoryUno')));
  servicesLocator.registerLazySingleton<TaskRepository>(
      () => TaskRepositoryFirebase(servicesLocator()),
      instanceName: 'MemoryUno');
  servicesLocator.registerLazySingleton(() => FirebaseFirestore.instance);
}
