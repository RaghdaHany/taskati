import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
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
          List<TaskModel> tasks = [];
          for (var task in box.values) {
            if (task.date == selectedDate) {
              tasks.add(task);
            }
          }
          if (tasks.isEmpty) {
            return Center(child: Lottie.asset(AppImages.empty, width: 300,height: 300));
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: completeTaskUI(),
                secondaryBackground: deleteTaskUI(),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    box.delete(tasks[index].id);
                  } else {
                    box.put(
                      tasks[index].id,
                      tasks[index].copyWith(isCompleted: true),
                    );
                  }
                },
                child: TaskCard(taskModel: tasks[index]),
              );
            },
          );
        },
      ),
    );
  }

  Container completeTaskUI() {
    return Container(
      margin: const EdgeInsets.only(bottom: 6.0),
      color: const Color.fromARGB(255, 20, 207, 3),
      child: Row(
        children: [
          Icon(Icons.check, color: Colors.white),
          Gap(10),
           Text(
            "complete",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Container deleteTaskUI() {
    return Container(
      margin: const EdgeInsets.only(bottom: 6.0),
      color: AppColors.redColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.delete, color: Colors.white),
          Gap(10),
           Text(
            "delete",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}