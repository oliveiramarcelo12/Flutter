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
                  itemCount: model.listarCarros.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da tarefa
                      title: Text(model.listarCarros[index].modelo),
                      
                      

                      //quando clicado o carro
                      onTap: () {
                       // criar método para trocar a tela
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