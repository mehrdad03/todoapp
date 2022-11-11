import 'package:flutter/material.dart';

class AddNewToDo extends StatelessWidget {
  TextEditingController newTodoInputController = TextEditingController();
  final Function addTodo;

  AddNewToDo({super.key, required this.addTodo});

  //for remove add new task input in footer
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoInputController,
      onSubmitted: (value) {
        if (value != "") {
          addTodo(value);
        }

        newTodoInputController.clear();
        // newTodoInputController.text='مهرداد';
      },
      decoration: const InputDecoration(
        hintText: "کار جدیدی اضافه کنید",
        border: InputBorder.none,
      ),
      style: TextStyle(color: Colors.grey[600], fontSize: 14),
    );
  }
}
