import 'package:hive_flutter/hive_flutter.dart';

class Tododatabase{
  List toDoList=[];
  final _mybox= Hive.box('mybox');

  void createinitialdata(){
    toDoList=[
      ["First def",false],
      ["Second def",false],
    ];
  }

  void loaddata(){
    toDoList=_mybox.get("TODOLIST");
  }

  void updatedatabase(){
    _mybox.put("TODOLIST",toDoList);
  }
}
