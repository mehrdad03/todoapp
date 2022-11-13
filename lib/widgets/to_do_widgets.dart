import 'package:flutter/material.dart';

class ToDoWidgets extends StatelessWidget {
  String title;
  bool isDone;
  Function toggleDone;
  ToDoWidgets({super.key, required this.title, required this.isDone,required this.toggleDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child:GestureDetector(
        onTap: ()=>toggleDone,
        child:  Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isDone ? Colors.red[400] : Colors.grey[400],
                borderRadius: BorderRadius.circular(5),
              ),
              margin: const EdgeInsets.only(left: 10),
              child: isDone
                  ? const Icon(
                Icons.check,
                size: 14,
                color: Colors.white,
              )
                  : null,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDone ? Colors.red[400] : Colors.grey[400],
                  decoration:
                  isDone ? TextDecoration.lineThrough : TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}
