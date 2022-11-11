import 'package:flutter/material.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/widgets/task/add_task_button.dart';
import 'package:todoapp/widgets/task/hero_section.dart';
import 'package:todoapp/widgets/task/task_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  void addNewTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void updateTask(Task task) {
    setState(() {
      tasks = tasks.map((taskItem) {
        if (taskItem.id == task.id) {
          return task;
        }
        return taskItem;
      }).toList();
    });
  }

  void deleteTask(int taskId) {
    setState(() {
      tasks=tasks.where((task) => task.id !=taskId).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Image(
                            width: 30,
                            height: 30,
                            image: AssetImage("assets/images/logo.png"),
                          ),
                          Icon(Icons.menu),
                        ],
                      ), //appBar
                      HeroSection(),
                      Expanded(
                          child: ListView.builder(
                              itemCount: tasks.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  TaskItem(
                                      context: context,
                                      index: index,
                                      task: tasks[index],
                                      updateTask: updateTask,
                                  deleteTask:deleteTask))),
                    ],
                  ),
                  AddTaskButton(addTask: addNewTask),
                ],
              ),
            ),
          ),
        ));
  }
}
