// Na tela de acesso após o login
import 'package:flutter/material.dart';

class TelaAcesso extends StatelessWidget {
  final String nome;

  TelaAcesso({required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo, $nome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Esta é a sua tela de acesso.'),
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de configuração
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaConfiguracao()),
                );
              },
              child: Text('Configuração'),
            ),
          ],
        ),
      ),
    );
  }
}

// Definição da tela de configuração
class TelaConfiguracao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuração'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Esta é a sua tela de configuração.'),
            // Adicione opções de configuração aqui
          ],
        ),
      ),
    );
  }
}
