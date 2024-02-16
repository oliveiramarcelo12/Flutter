import 'package:flutter/material.dart';
import "dart:math";

//void main() {
  //Declarando a inicializando variáveis
 // String nome = "João";
  //int idade = 25;
 // double altura = 1.75;
 // bool estudante = true;

  // Imprimindo
 // print("Nome: $nome");
 // print("Idade: $idade anos");
// print("Altura $altura metros");
 // print("Estudante: $estudante");
//}
 
 //void main() {
// Operações aritméticas com variáveis
//int numero1 = 10;
//int numero2 = 5;
//int soma = numero1 + numero2;
//int subtracao = numero1 - numero2;
//int multiplicacao = numero1 * numero2;
//double divisao = numero1 / numero2;

// Imprimindo resultados
//print("Soma: $soma");
//print("Subtração: $subtracao");
//print("Multiplicação: $multiplicacao");
//print("Divisão: $divisao");
//}

//void main() {
// Concatenação de strings com variáveis
//String nome = "Maria";
//int idade = 30;

// Utilizando concatenação
//String mensagem = "Olá, meu nome é $nome e tenho $idade anos.";

// Imprimindo a mensagem
//print(mensagem);
//}




void main() {
runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
  class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}
}
}
class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  TextEditingController _controllerNumero2 = TextEditingController();
  String _resultado = '';

  void _calcular(String operacao) {
    double numero1 = double.tryParse(_controllerNumero1.text) ?? 0.0;
    double numero2 = double.tryParse(_controllerNumero2.text) ?? 0.0;
    double resultado;

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
       
        default:
          resultado = 0.0;
      }

      _resultado = resultado != null ? 'Resultado: $resultado' : 'Erro na operação';
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
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controllerNumero2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calcular('Somar'),
              child: Text('Somar'),
            ),
            SizedBox(height: 16.0),
            Text(_resultado, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}