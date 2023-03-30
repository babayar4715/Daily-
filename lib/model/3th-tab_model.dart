import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../constants/app_colors.dart';

class TodoTile extends StatelessWidget {
  final String taskame;
  final bool taskComplated;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    Key? key,
    required this.taskame,
    required this.taskComplated,
    required this.onChanged,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: AppColor.TODO,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColor.idontknow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // chekbox
              Checkbox(
                value: taskComplated,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              // taskame
              Text(
                taskame,
                style: TextStyle(
                    decoration: taskComplated
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
