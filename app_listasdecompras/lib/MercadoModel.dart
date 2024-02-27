import 'package:flutter/material.dart';

// Classe responsável por representar um produto
class Produtos {
  String descricao; // Descrição do produto
  String tipo; // Tipo do produto
  bool concluida; // Indica se a compra do produto foi concluída ou não
  DateTime dataHora; // Data e hora da criação do produto

  // Construtor da classe Produtos
  Produtos(this.descricao, this.tipo, this.concluida, this.dataHora);
}
