import 'package:app_todolist/MercadoApp.dart';
import 'package:app_todolist/MercadoController.dart';
import 'package:app_todolist/MercadoView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MercadoController(),
      child: MaterialApp(
        home: ListaMercadoScreen(),
      ),
    ),
  );
}

