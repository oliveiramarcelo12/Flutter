import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: AdivinheONumero(),
  ));
}

class AdivinheONumero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JogoAdivinhacao(),
    );
  }
}

class JogoAdivinhacao extends StatefulWidget {
  @override
  _JogoAdivinhacaoState createState() => _JogoAdivinhacaoState();
}

class _JogoAdivinhacaoState extends State<JogoAdivinhacao> {
  final _random = Random();
  late int _numeroAlvo;
  late int _palpite;
  int _tentativas = 0;
  String _textoResultado = '';
  TextEditingController _controlador = TextEditingController();

  @override
  void initState() {
    super.initState();
    _numeroAlvo = _random.nextInt(100) + 1;
  }

  void _verificarPalpite() {
    setState(() {
      _palpite = int.tryParse(_controlador.text)!;
      _tentativas++;

      if (_palpite == null) {
        _textoResultado = 'Por favor, insira um número válido.';
      } else if (_palpite < _numeroAlvo) {
        _textoResultado = 'Tente um número maior.';
      } else if (_palpite > _numeroAlvo) {
        _textoResultado = 'Tente um número menor.';
      } else {
        _textoResultado =
            'Parabéns! Você acertou o número $_numeroAlvo em $_tentativas tentativas.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivinhe o Número'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controlador,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Digite um número'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _verificarPalpite,
              child: Text('Verificar'),
            ),
            SizedBox(height: 16.0),
            Text(
              '$_textoResultado',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
