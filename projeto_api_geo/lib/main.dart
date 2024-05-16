
import 'package:flutter/material.dart';

import 'View/favorito_screen.dart';
import 'View/historic_screen.dart';
import 'View/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto API',
      home:HomeScreen(), 
      debugShowCheckedModeBanner: false,
      routes: {
        '/historico': (context) => HistoricoScreen(),
        '/favorito': (context) => FavoritoScreen(),
      },
    );
  }
}
