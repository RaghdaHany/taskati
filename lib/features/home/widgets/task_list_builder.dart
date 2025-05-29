import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/features/home/widgets/task_card.dart';

class TaskListBuilder extends StatelessWidget {
  const TaskListBuilder({
    super.key, required this.selectedDate,
  });

final String selectedDate;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ValueListenableBuilder(
            valueListenable: LocalStorage.taskBox.listenable(),
            builder: (context, box, child) {
              List<TaskModel> tasks = box.values
              .toList()
              .where((task) => task.date == selectedDate)
              .toList();

              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskCard(
                    taskModel: tasks[index], );
                },
              );
            },
            ));
  }
}
