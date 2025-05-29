import 'package:hive/hive.dart';
import 'package:taskati/core/model/task_model.dart';

class LocalStorage {
  static late Box _box;
  static late Box<TaskModel> taskBox;

  static const String name = 'name';
  static const String image = 'image';

  static init() {
    _box = Hive.box('user');
    taskBox = Hive.box<TaskModel>('tasks');

  }

  static cacheData(String key, String value) {
    _box.put(key, value);
  }

  static getData(String key) {
    return _box.get(key);
  }

   static cacheTask(String key, TaskModel value) {
    taskBox.put(key, value);
  }

  static TaskModel? getTask(String key) {
    return taskBox.get(key);
  }
}