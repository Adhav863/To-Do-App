// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todoapp/util/mybutton.dart';

class Dialogbox extends StatelessWidget {
  final mycontroller;
  VoidCallback onsave;
  VoidCallback oncancel;
   Dialogbox({super.key, required this.mycontroller,required this.onsave,required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[100],
        
      content: SizedBox(
        height:120,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller:mycontroller,
              decoration: InputDecoration(
                border:OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  Mybutton(text: "SAVE", onPressed:onsave),
                  const SizedBox(width: 6,),
                  Mybutton(text: "CANCEL", onPressed: oncancel),
              ],
            )
            
          ],
        )
      ),
    );
  }
}