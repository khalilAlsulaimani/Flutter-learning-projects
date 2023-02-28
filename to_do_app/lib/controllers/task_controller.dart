import 'package:get/get.dart';
import 'package:todo/db/db_helper.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  final RxList<Task> taskList = <Task>[].obs;

  Future<void> getTasks() async {
    final List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJS(data)).toList());
  }

  void deleteTasks({required Task task}) async {
    DBHelper.deleteTask(task);
    getTasks();
  }

  void markAsCompleted({required Task task}) async {
    DBHelper.update(task);
    getTasks();
  }

  addTask({required Task task}) async {
    DBHelper.insert(task);
  }

  void deleteAll() async {
    DBHelper.deleteAll();
  }
}
