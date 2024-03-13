import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Site Responsivo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Site Responsivo'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Use MediaQuery para ajustar o layout com base no tamanho da tela
            if (constraints.maxWidth > 600) {
              // Se a largura da tela for maior que 600, exiba um layout em duas colunas
              return TwoColumnLayout();
            } else {
              // Caso contrário, exiba um layout em uma coluna
              return SingleColumnLayout();
            }
          },
        ),
      ),
    );
  }
}

class TwoColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.green,
            height: 200,
            child: Center(
              child: Text(
                'Coluna 1',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            height: 200,
            child: Center(
              child: Text(
                'Coluna 2',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SingleColumnLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Colors.green,
          height: 200,
          child: Center(
            child: Text(
              'Coluna 1',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          color: Colors.blue,
          height: 200,
          child: Center(
            child: Text(
              'Coluna 2',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
