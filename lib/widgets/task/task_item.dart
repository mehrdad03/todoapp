import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {

  BuildContext context;
  int index;

  TaskItem({super.key,required this.context,required this.index});


  @override
  Widget build(BuildContext context) {
    return Container(
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
                'کارها شماره 1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              Text(
                'توضیحات کار شماره 1توضیحات کار شماره 1',
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
    );
  }
}
