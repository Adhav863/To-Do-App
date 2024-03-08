import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/homepage.dart';

void main() async{
  await Hive.initFlutter();
// open a box
await Hive.openBox('mybox');
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const Homepage(),
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}
