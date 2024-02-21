import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

// Aplicativo da Calculadora
class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

// Widget da Calculadora
class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

// Estado da Calculadora
class _CalculadoraState extends State<Calculadora> {
  // Controladores de texto para os campos de entrada dos números
  TextEditingController _controllerNumero1 = TextEditingController();
  TextEditingController _controllerNumero2 = TextEditingController();
  // Variável para armazenar o resultado da operação
  String _resultado = '';

  // Método para calcular a operação selecionada
  void _calcular(String operacao) {
    // Extrai os números dos campos de entrada, com tratamento para valores inválidos
    double numero1 = double.tryParse(_controllerNumero1.text) ?? 0.0;
    double numero2 = double.tryParse(_controllerNumero2.text) ?? 0.0;
    double? resultado;

    // Atualiza o estado da interface para refletir o resultado da operação
    setState(() {
      switch (operacao) {
        case 'Somar':
          resultado = numero1 + numero2;
          break;
        case 'Subtrair':
          resultado = numero1 - numero2;
          break;
        case 'Multiplicar':
          resultado = numero1 * numero2;
          break;
        case 'Dividir':
          // Verifica se o divisor é zero para evitar uma divisão por zero
          if (numero2 != 0) {
            resultado = numero1 / numero2;
          } else {
            resultado = null; // Indica um erro na operação
          }
          
          break;
        default:
          resultado = 0.0;
      }
      // Atualiza a variável que exibe o resultado na interface
      _resultado =
          resultado != null ? 'Resultado: $resultado' : 'Erro na operação';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de entrada para o primeiro número
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 16.0), // Espaçamento entre os widgets
            // Botões de operação
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calcular('Somar'),
                  child: Text('Somar'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('Subtrair'),
                  child: Text('Subtrair'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('Multiplicar'),
                  child: Text('Multiplicar'),
                ),
                ElevatedButton(
                  onPressed: () => _calcular('Dividir'),
                  child: Text('Dividir'),
                ),
              ],
            ),
            SizedBox(height: 16.0), // Espaçamento entre os widgets
            // Campo de entrada para o segundo número
            TextField(
              controller: _controllerNumero2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 16.0), // Espaçamento entre os widgets
            // Exibição do resultado da operação
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
