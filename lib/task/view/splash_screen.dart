import 'package:flutter/material.dart';
import 'package:task_manager/task/controller/task_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController controller = TaskController();
    controller.contiueToHome(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
            height: MediaQuery.of(context).size.width * .5,
            width: MediaQuery.of(context).size.height * .5,
            child: const Image(image: AssetImage('asset/images.png'))),
      ),
    );
  }
}
