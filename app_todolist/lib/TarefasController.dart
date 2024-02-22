import 'package:app_todolist/TarefasModel.dart';
import 'package:flutter/material.dart';

class TarefasController extends ChangeNotifier{
  //lista de tarefas
  List<Tarefa> _tarefas= [];
  //Getter para acessar a lkista de tarefas
  List <Tarefa> get tarefas => _tarefas;

  //Método para adicionar uma nova tarefa á lista
  void adicionarTarefa(String descricao){
    _tarefas.add(Tarefa(descricao, false));
    //Notifica os ouvintes (widgets) sobre a mudança no estado
    notifyListeners();
  }
  // Método para marcar uma tarefa como concluída com base no índice
  void marcarComoConcluida (int indice){
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      notifyListeners();
      
    }
  }

  
}