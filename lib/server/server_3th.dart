import 'package:hive/hive.dart';

import '../constants/app_text.dart';

class ToDoServer {
  // server all to to..
  List toDoList = [];
  final _myBox = Hive.box(AppTexts.Mybox);

  //
  void createInitialData() {
    toDoList = [
      [AppTexts.ToDo1, false],
      [AppTexts.ToDo2, false],
    ];
  }

  // load the data from server
  void loaddata() {
    toDoList = _myBox.get(AppTexts.Listtodo);
  }

  //  update the server
  void updateDataBase() {
    _myBox.put(AppTexts.Listtodo, toDoList);
  }
}
