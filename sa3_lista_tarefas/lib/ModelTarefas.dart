import 'package:flutter/material.dart';

class Tarefas {
  String descricao;
  bool concluida;
  DateTime dataHora; // Novo atributo para armazenar a data e hora da tarefa

  Tarefas({
    required this.descricao,
    required this.concluida,
    required this.dataHora,
  });
}
