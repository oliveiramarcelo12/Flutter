import 'dart:convert';

import 'package:flutter/services.dart';

import '../Model/livros_model.dart';

class LivroController {
  List<Livro> livros = [];

  Future<List<Livro>> loadLivros() async {
    final data = await rootBundle.loadString("assets/livros.json");
    final listLivros = json.decode(data) as List<dynamic>;
    livros.clear();
    livros.addAll(listLivros.map((e) => Livro.fromJson(e)));
    return livros;
  }

}


