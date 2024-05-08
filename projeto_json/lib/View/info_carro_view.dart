import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projeto_json/Model/carros_model.dart';

class CarroInfoPage extends StatelessWidget {
  final Carro carro;

  const CarroInfoPage({Key? key, required this.carro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do Carro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(
              File(carro.foto),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              'Modelo: ${carro.modelo}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Marca: ${carro.marca}'),
            Text('Placa: ${carro.placa}'),
            Text('Ano: ${carro.ano}'),
            Text('Cor: ${carro.cor}'),
            Text('Descrição: ${carro.descricao}'),
            Text('Valor: ${carro.valor}'),
          ],
        ),
      ),
    );
  }
}
