import 'package:rxdart/subjects.dart';

abstract class StreamState<T> {
  final _modelsStreamController = BehaviorSubject<List<T>>.seeded(const []);

  Stream<List<T>> get streamEntities =>
      _modelsStreamController.asBroadcastStream();
  List<T> get entities => _modelsStreamController.value;

  Stream<List<T>> refresh(List<T> models) {
    _modelsStreamController.add(models);
    return streamEntities;
  }

  attach(T model) {
    final models = [..._modelsStreamController.value];
    models.add(model);
    _modelsStreamController.add(models);
  }
/** 
  detach(T model) {
    final models = [..._modelsStreamController.value];
    final modelIndex = models.indexWhere((it) => it.id == model.id);
    if (modelIndex >= 0) {
      models.removeAt(modelIndex);
      _modelsStreamController.add(models);
    }
  }

  replace(T model) {
    final models = [..._modelsStreamController.value];
    final modelIndex = models.indexWhere((it) => it.id == model.id);
    if (modelIndex >= 0) {
      models[modelIndex] = model;
      _modelsStreamController.add(models);
    }
  }
  */
}
