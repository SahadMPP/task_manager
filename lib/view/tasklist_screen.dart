import 'package:flutter/material.dart';
import 'package:task_manager/view/add_task_screen.dart';
import 'package:task_manager/view/task_detail_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Task List'),
      ),
      floatingActionButton: SizedBox(
        width: 100,
        child: FloatingActionButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddTaskScreen(),));
        },child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Add Task'),
            Icon(Icons.add)
          ],
        ),),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TaskDetailScreen(),));
            },
            child: ListTile(
              title: const Text('Title'),
              trailing: Checkbox(value: false, onChanged: (value){}),
            ),
          )
        ],
      ),
    );
  }
}