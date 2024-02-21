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
  bool _mostrarBotaoVerificar = true; // Variável para controlar a visibilidade do botão de verificar
  bool _mostrarBotaoTentarNovamente = false;

  @override
  void initState() {
    super.initState();
    _iniciarJogo();
  }

  void _iniciarJogo() {
    setState(() {
      _numeroAlvo = _random.nextInt(100) + 1;
      _tentativas = 0;
      _textoResultado = '';
      _controlador.text = '';
      _mostrarBotaoVerificar = true; // Mostra o botão de verificar ao iniciar um novo jogo
      _mostrarBotaoTentarNovamente = false;
    });
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
        _mostrarBotaoVerificar = false; // Oculta o botão de verificar ao acertar o número
        _mostrarBotaoTentarNovamente = true;
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
            Visibility(
              visible: _mostrarBotaoVerificar,
              child: ElevatedButton(
                onPressed: _verificarPalpite,
                child: Text('Verificar'),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '$_textoResultado',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Visibility(
              visible: _mostrarBotaoTentarNovamente,
              child: ElevatedButton(
                onPressed: _iniciarJogo,
                child: Text('Tentar Novamente'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
