import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/task/controller/task_controller.dart';
import 'package:task_manager/task/repo/task_model.dart';

class TaskDetailScreen extends StatelessWidget {
  final TaskModel data;

  const TaskDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());
    TextEditingController controller = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    taskController.detailPageTaskText.value = data.title!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 70,
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Title :",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 200,
                    ),
                    child: Obx(
                      () => Text(taskController.detailPageTaskText.value,
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                    )),
              ],
            ),
          ),
          const Spacer(),
          CustomButton(
            onpressed: () {
              Get.defaultDialog(
                barrierDismissible: false,
                title: 'Update',
                content: Form(
                  key: formKey,
                  child: TextFormField(
                    controller: controller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field is Empty';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: data.title,
                    ),
                  ),
                ),
                confirm: ElevatedButton(
                    onPressed: () {
                      var task = TaskModel(
                        id: data.id,
                        title: controller.text,
                      );
                      taskController.updateTask(task);
                      Navigator.of(context).pop();
                    },
                    child: const Text('update')),
                cancel: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.red[100]!,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
            text: 'Edit',
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const CustomButton({
    super.key,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onpressed,
            style: const ButtonStyle(
                shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)))),
                backgroundColor: WidgetStatePropertyAll(Colors.white30)),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
