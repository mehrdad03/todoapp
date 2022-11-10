import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget{
  const TaskScreen({super.key});

  @override
  State<StatefulWidget> createState()=>TaskScreenState();
}

class TaskScreenState extends State<TaskScreen>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Text("سلام"),
          ),
        ),
      ),
    );
  }

}