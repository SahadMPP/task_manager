import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/task/controller/task_controller.dart';
import 'package:task_manager/task/view/add_task_screen.dart';
import 'package:task_manager/task/view/task_detail_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Task List'),
      ),
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ));
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Add Task'), Icon(Icons.add)],
          ),
        ),
      ),
      body: Column(
        children: [
          Obx(() {
            if (taskController.taskList.isEmpty) {
              return const Expanded(
                  child: Center(child: Text('List is empty')));
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: taskController.taskList.length,
                  itemBuilder: (context, index) {
                    var data = taskController.taskList[index];
                    return ListTile(
                      title: Text(data.title!),
                      trailing: Checkbox(
                          value: data.isCompleted == 1,
                          onChanged: (value) {
                        taskController.deleteTask(data.id!);
                          }),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TaskDetailScreen(data: data),
                        ));
                      },
                    );
                  },
                ),
              );
            }
          })
        ],
      ),
    );
  }
}
