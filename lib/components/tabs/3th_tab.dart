import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text.dart';
import '../../server/server_3th.dart';

class ThirdTab extends StatefulWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  final _myBox = Hive.box(AppTexts.Mybox);
  ToDoServer db = ToDoServer();

  @override
  void initState() {
    //  if it the first tome over opening the app, then creat default data
    if (_myBox.get(AppTexts.Listtodo) == null) {
      db.createInitialData();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  // text coontroller
  final _controller = TextEditingController();

  // checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    // save new Task
    // delete task
    void deleteTask(int index) {
      setState(() {
        db.toDoList.removeAt(index);
      });
      db.updateDataBase();
    }

    void saveNewTask() {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updateDataBase();
    }

    void creatNewTask() {
      showDialog(
        context: context,
        builder: (context) {
          return DialogBax(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: AppColor.bgcolor,
      appBar: AppBar(
        title: const Text("Habits"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskame: db.toDoList[index][0],
            taskComplated: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}

// dialog.bax

class DialogBax extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBax({
    Key? key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.bggCAl,
      content: Container(
        height: 200,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                fillColor: Colors.red,
                border: OutlineInputBorder(),
                hintText: AppTexts.task,
              ),
            ),

            //  buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: AppTexts.Save, onPressed: onSave),
                const SizedBox(width: 8),

                // cancel button
                MyButton(text: AppTexts.Cancel, onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// my_button

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}

// to do tile

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
          motion: StretchMotion(),
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
            color: Color.fromARGB(255, 71, 123, 201),
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
