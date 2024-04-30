import 'package:flutter/material.dart';

import '../Model/livros_model.dart';

class LivroInfoPage extends StatelessWidget {
  Livro info;
  LivroInfoPage({required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livro Info'),
      ),
      body: Expanded(
          child: Column(
        children: [
          Image.asset(info.capa),
          Text(info.titulo),
          Text(info.autor),
          Text(info.sinopse),
          Text(info.categoria),
          Text("${info.isbn}"),
        ],
      )),
    );
  }
}
