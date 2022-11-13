import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/models/todo.dart';
import 'dart:ui' as ui;

import 'package:todoapp/widgets/to_do_widgets.dart';
import 'package:todoapp/widgets/todo/add_new_to_do.dart';

class TaskScreen extends StatefulWidget {
  Task? task;

  TaskScreen({super.key, this.task});

  @override
  State<StatefulWidget> createState() => TaskScreenState();
}

class TaskScreenState extends State<TaskScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();

  //for show default inputs value
  @override
  initState() {
    super.initState();
    if (widget.task != null) {
      taskTitleController.text = widget.task?.title ?? "";
      taskDescriptionController.text = widget.task?.description ?? "";
    }
  }

  addTodo(value) {
    widget.task?.addNeTodo(value);
    setState(() {
      //refresh to dos list
    });
  }

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
                          Navigator.pop(context, widget.task);
                        },
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.grey[700],
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: TextField(
                          controller: taskTitleController,
                          onSubmitted: (value) {
                            if (value != "") {
                              if (widget.task == null) {
                                setState(() {
                                  widget.task = Task(
                                      title: value,
                                      id: DateTime.now().microsecondsSinceEpoch,
                                      todos: []);
                                });
                              } else {
                                widget.task?.title = value;
                              }
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: 'عنون کار شما',
                              border: InputBorder.none),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ))
                    ],
                  ),
                  Visibility(
                      visible: widget.task != null,
                      child: TextField(
                        controller: taskDescriptionController,
                        onSubmitted: (value) {
                          widget.task?.description = value;
                        },
                        /*  onChanged: (value) {
                          widget.task?.description = value;
                        },*/

                        decoration: const InputDecoration(
                          hintText: 'توضیح کار خود رو وراد کنید',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 3,
                      )),
                  Visibility(
                      visible: widget.task != null,
                      child: Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ListView.builder(
                          itemCount: widget.task?.todos.length ?? 0,
                          itemBuilder: (context, index) => ToDoWidgets(
                              title: widget.task?.todos[index].title ?? "",
                              isDone: widget.task?.todos[index].isDone ?? false,
                          toggleDone:(){
                                widget.task?.toggleDoneTodo(widget.task?.todos[index].id);
                                setState(() {
                                  //for refresh
                                });
                          }),
                        ),
                      ))),
                  Visibility(
                      visible: widget.task != null,
                      child: Row(
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
                          Expanded(child: AddNewToDo(addTodo: addTodo))
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
