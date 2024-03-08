// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialogbox.dart';
import 'package:todoapp/util/todotile.dart';

class Homepage extends StatefulWidget {
  
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Tododatabase db= Tododatabase();
  final _mybox=Hive.box('mybox');

  @override
  void initState() {

    if(_mybox.get("TODOLIST")==null){
      db.createinitialdata();
    }else{
      db.loaddata();
    }
    super.initState();
  }


  final mycontroller= TextEditingController();


  void savenewtask(){
    setState(() {
      db.toDoList.add([mycontroller.text,false]);
      mycontroller.clear();
    });
    Navigator.of(context).pop();
    db.updatedatabase();
  }

  void checkboxchanged(bool? value,int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updatedatabase();
  }

  void deletetask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updatedatabase();
  }

  void createNewTask(){
    mycontroller.clear();
    showDialog(
    context: context, 
    builder:(context){
      return Dialogbox(
       mycontroller: mycontroller,
       onsave: savenewtask,
       oncancel: ()=> Navigator.of(context).pop(),
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask,child:Icon(Icons.add)),
      body:ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder:(context,index){
          return ToDoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1],
            onChanged: (value)=> checkboxchanged(value,index),
            deletefunction: (context)=> deletetask(index),
          );
        }
      ),
    );
  }
}