import 'package:flutter/material.dart';
import 'package:sa2_correcao/ViewLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "SA2", 
        debugShowCheckedModeBanner: false, 
        home: LoginScreen()
        );
  }
}
