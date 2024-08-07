import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/task/controller/task_controller.dart';
import 'package:task_manager/task/repo/task_model.dart';
import 'package:task_manager/task/view/task_detail_screen.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    final TaskController taskController = Get.put(TaskController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Add Task'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Task Field is Empty';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(
                    hintText: 'Enter Task...',
                    hintStyle: TextStyle(fontSize: 12),
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          const Spacer(),
          CustomButton(
              text: 'Add Task',
              onpressed: () {
                if (formKey.currentState!.validate()) {
                  var data = TaskModel(title: controller.text);
                  taskController.addTask(data);
                }
              }),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
