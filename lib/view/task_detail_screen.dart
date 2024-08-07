import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              border: Border.all(color: Colors.grey)
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Title :",style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
                ConstrainedBox(constraints: const BoxConstraints(
                  maxWidth: 200,
                ),child: const Text("Title",maxLines: 1,overflow: TextOverflow.ellipsis)),
              ],
            ),
          ),
          const Spacer(),
           CustomButton(onpressed: (){},text: 'Edit',),
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
    super.key, required this.text, required this.onpressed,
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
              shape: WidgetStatePropertyAll(ContinuousRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
                backgroundColor: WidgetStatePropertyAll(Colors.white30)),
            child:  Text(text,style: const TextStyle(color: Colors.white),),
          )),
    );
  }
}
