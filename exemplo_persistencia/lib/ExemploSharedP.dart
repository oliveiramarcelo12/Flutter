import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    title: "Lista de Tarefas",
    theme: ThemeData(primarySwatch: Colors.blue),
    home: TaskListScreen(),
   )
  }

  
}

class TaskListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  
  }
}