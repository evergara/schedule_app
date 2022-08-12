import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';

class ItemTask extends StatelessWidget {
  const ItemTask({Key? key, required this.task}) : super(key: key);

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(task.description),
    );
  }
}
