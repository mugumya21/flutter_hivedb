import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rental_app/data/database.dart';
import 'package:rental_app/pages/util/dialog_box.dart';
import 'package:rental_app/pages/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');

  DataBase db = DataBase();
  // get text
  final _controller = TextEditingController();

  // inital opening the app
  @override
  void initState() {
    if (_mybox.get('TODOLIST') == null) {
      db.createintial();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  // void function for onchanged
  void thecheckboxclicked(bool? value, index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updatedatabase();
  }

  void saveclicked() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
    db.updatedatabase();
  }

  // opendialogbox
  void opendialogbox() {
    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(
              controller: _controller,
              oncancel: () => Navigator.of(context).pop(),
              onsave: saveclicked,
            );
          });
    });
  }

  void deleteFunction(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updatedatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.yellow[200],
      floatingActionButton: FloatingActionButton(
          onPressed: opendialogbox,
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
              taskName: db.todoList[index][0],
              iscompleted: db.todoList[index][1],
              deleteFunction: (context) => deleteFunction(index),
              onChanged: (value) => thecheckboxclicked(value, index));
        },
      ),
    );
  }
}
