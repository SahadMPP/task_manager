import 'package:flutter/material.dart';
import 'package:task_manager/view/task_detail_screen.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Task'),
      ),
      body: Column(
        children: [
           const SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter Task...',
                hintStyle: TextStyle(
                  fontSize: 12
                ),
                border: OutlineInputBorder()
              ),
            ),
          ),
          const Spacer(),
           CustomButton(text: 'Add Task', onpressed: (){}),
           const SizedBox(height:20)
        ],
      ),
    );
  }
}