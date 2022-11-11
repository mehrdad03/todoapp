import 'package:flutter/material.dart';
import '../../models/task.dart';
import '../../screens/task.dart';

class AddTaskButton extends StatelessWidget {
final Function addTask;

 AddTaskButton({super.key, required this.addTask});

  void switchToTaskCreateTask (context) async {
    Task? task=await Navigator.push(context,
        MaterialPageRoute(
            builder: (context) =>  TaskScreen()
        )
    );

    if(task !=null){
      addTask(task);
    }
  }



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
