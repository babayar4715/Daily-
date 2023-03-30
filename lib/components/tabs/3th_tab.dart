import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_text.dart';
import '../../model/3th-tab_model.dart';
import '../../server/server_3th.dart';
import '../buttons/3th_tab_button.dart';
import '../dialog/3th_tab_dialog.dart';

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
      db.HabitList[index][1] = !db.HabitList[index][1];
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    // save new Task
    // delete task
    void deleteTask(int index) {
      setState(() {
        db.HabitList.removeAt(index);
      });
      db.updateDataBase();
    }

    void saveNewTask() {
      setState(() {
        db.HabitList.add([_controller.text, false]);
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
      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: const Text(
          AppTexts.Ad,
        ),
      ),
      body: ListView.builder(
        itemCount: db.HabitList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskame: db.HabitList[index][0],
            taskComplated: db.HabitList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}

// dialog.bax

// my_button

// to do tile