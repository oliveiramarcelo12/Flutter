import 'package:sa2_autenticacao_configuracao/Controller/Controller.dart';
import 'package:flutter/material.dart';

BancoDadosCrud bancoDados = BancoDadosCrud();

String email = 'john@example.com';
String senha = 'senha123';

Map<String, dynamic>? usuario = await bancoDados.buscarUsuario(email);
if (usuario != null && usuario['senha'] == senha) {
  // Login bem-sucedido
  String nome = usuario['nome'];
  print('Login bem-sucedido para o usuário $nome');
} else {
  // Credenciais inválidas ou usuário não encontrado
  print('Credenciais inválidas ou usuário não encontrado');
}
