import 'package:app_carros/Controller.dart';
import 'package:app_carros/Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaCarro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campo de texto para adicionar nova tarefa
         
          // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<CarroController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.tarefas.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da tarefa
                      title: Text(model.tarefas[index].descricao),
                      // Checkbox para marcar a tarefa como concluída
                      trailing: Checkbox(
                        value: model.tarefas[index].concluida ?? false,
                        onChanged: (value) {
                          if (value != null) {
                            if (value) {
                              model.marcarComoConcluida(index);
                            } else {
                              model.desmarcarComoConcluida(index);
                            }
                          }
                        },
                      ),

                      // Exclui a tarefa ao manter pressionado
                      onLongPress: () {
                        // Chamando o método excluirTarefa do Provider para atualizar o estado
                        model.excluirTarefa(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  

  
}
class TelaDetalheCarro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  
}