import 'package:flutter/material.dart';

import '../../models/task.dart';
import '../../screens/task.dart';

class TaskItem extends StatelessWidget {

  final BuildContext context;
  final int index;
  final Task task;
  final Function updateTask;


   const TaskItem({super.key,required this.context,required this.index, required this.task,required this.updateTask});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        Task? task=await Navigator.push(context,
            MaterialPageRoute(
                builder: (context) =>  TaskScreen(task:this.task)
            )
        );
        updateTask(task);

      /*  if(task !=null){
          addTask(task);
        }*/

      },

        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        task.description ?? "توضیحی وارد نضده است",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      )
                    ],
                  )),
              const Icon(
                Icons.delete,
                color: Colors.red,
                size: 20,
              )
            ],
          ),
        )
    );
  }
}
