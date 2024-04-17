import 'package:flutter/material.dart';
import 'package:sa3_lista_tarefas/Viewlogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "SA3", 
        debugShowCheckedModeBanner: false, 
        home: LoginScreen()
        );
  }
}
