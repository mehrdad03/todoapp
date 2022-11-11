import 'package:flutter/material.dart';
import 'package:todoapp/models/todo.dart';
import 'dart:ui' as ui;

import 'package:todoapp/widgets/to_do_widgets.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<StatefulWidget> createState() => TaskScreenState();
}

class TaskScreenState extends State<TaskScreen> {
  List<Todo> tasks = [];
  TextEditingController newTodoInputController =
      TextEditingController(); //for remove add new task input in footer

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.grey[700],
                        ),
                      ),
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'عنون کار شما',
                              border: InputBorder.none),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ))
                    ],
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'توضیح کار خود رو وراد کنید',
                      border: InputBorder.none,
                    ),
                    minLines: 1,
                    maxLines: 3,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) =>
                          ToDoWidgets(title: tasks[index].title, isDone: false),
                    ),
                  )),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: const Color.fromARGB(80, 0, 0, 0),
                            ),
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      Expanded(
                          child: TextField(
                        controller: newTodoInputController,
                        onSubmitted: (value) {
                          setState(() {
                            tasks.add(Todo(title: value, isDone: false));
                          });
                          newTodoInputController.clear();
                          // newTodoInputController.text='مهرداد';
                        },
                        decoration: const InputDecoration(
                          hintText: "کار جدیدی اضافه کنید",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
