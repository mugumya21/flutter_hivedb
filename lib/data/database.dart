import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  List todoList = [];

  // reference tbe box
  final box = Hive.box('mybox');

  void createintial() {
    // list of to do
    todoList = [
      ["Make a video", false],
      ["Done the Excerise", false]
    ];
  }

  void loaddata() {
    todoList = box.get('TODOLIST');
  }

  void updatedatabase() {
    box.put('TODOLIST', todoList);
  }
}
