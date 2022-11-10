import 'package:flutter/material.dart';
import '../../screens/task.dart';

class AddTaskButton extends StatelessWidget {



  void switchToTaskCreateTask (context) {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => const TaskScreen()
        )
    );
  }

  const AddTaskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 10,
        left: 0,
        child: GestureDetector(
          onTap: ()=>switchToTaskCreateTask(context),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}
