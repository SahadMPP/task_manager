import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_manager/task/repo/task_model.dart';
import 'package:task_manager/task/repo/task_repo.dart';
import 'package:task_manager/task/view/tasklist_screen.dart';

class TaskController extends GetxController {
  TaskRepo taskRepo = TaskRepoImpli();
  var taskList = <TaskModel>[].obs;
  var detailPageTaskText = 'null'.obs;


  @override
  void onInit() {
    initializeDatabaseAndLoadTasks();
    loadTasks();
    super.onInit();
  }

  Future<void> initializeDatabaseAndLoadTasks() async {
    await taskRepo.initialzeDataBase();
    loadTasks();
  }

  Future<void> loadTasks() async {
    List<TaskModel> tasks = await taskRepo.getAllTask();
    taskList.addAll(tasks);
  }

  addTask(TaskModel taskModel) async {
    await taskRepo.addTask(taskModel);
    taskList.clear();
    await loadTasks().whenComplete(
      () {
        Get.closeAllSnackbars();
        Get.snackbar('Task Added', '');
      },
    );
  }

  deleteTask(int value) async {
    await taskRepo.deleteTask(value);
    taskList.clear();
    await loadTasks().whenComplete(
      () {
        Get.closeAllSnackbars();
        Get.snackbar('Task Completed', '');
      },
    );
  }

  updateTask(TaskModel taskModel) async {
    await taskRepo.updatetask(taskModel);
    taskList.clear();
    await loadTasks().whenComplete(
      () {
        detailPageTaskText.value = taskModel.title!;
        Get.closeAllSnackbars();
        Get.snackbar('Task Updated', '');
      },
    );
  }

  contiueToHome(context)async{
   await Future.delayed(const Duration(seconds: 2));
   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const TaskListScreen(),),(route) => false,);
  }
}
