// Importações necessárias
import 'package:app_todolist/MercadoModel.dart';
import 'package:flutter/material.dart';

// Classe responsável pelo controle dos dados do mercado
class MercadoController extends ChangeNotifier {
  // Lista de produtos
  List<Produtos> _produtos = [];
  
  // Lista de tipos de produtos
  List<String> tiposDeProdutos = [
    'Eletrônicos',
    'Roupas',
    'Acessórios',
    'Cuidados Pessoais',
    'Casa e Decoração',
    'Frutas',
    'Verduras',
    'Laticínios',
    'Carnes',
    'Grãos',
    // Adicione outros tipos conforme necessário
  ];

  // Getter para acessar a lista de produtos
  List<Produtos> get produtos => _produtos;

  // Método para adicionar um novo produto à lista
  void adicionarProduto(String descricao, String tipo) {
    if (descricao.isNotEmpty && tipo.isNotEmpty) {
      // Verifica se a descrição e o tipo não estão vazios
      // Verifica se o produto já existe na lista
      bool produtoExistente = _produtos.any((produto) => produto.descricao == descricao);
      if (!produtoExistente) {
        // Adiciona o novo produto à lista apenas se não existir na lista
        DateTime dataAtual = DateTime.now();
        _produtos.add(Produtos(descricao, tipo, false, dataAtual));
        // Notifica os ouvintes (widgets) sobre a mudança no estado
        notifyListeners();
      }
    }
  }

  // Método para atualizar um produto existente na lista
  void atualizarProduto(int indice, String novaDescricao, String novoTipo) {
    if (indice >= 0 && indice < _produtos.length) {
      // Verifica se o índice está dentro dos limites da lista
      _produtos[indice].descricao = novaDescricao;
      _produtos[indice].tipo = novoTipo;
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para marcar um produto como concluído
  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _produtos.length) {
      _produtos[indice].concluida = true;
      notifyListeners();
    }
  }

  // Método para desmarcar a conclusão de um produto
  void desmarcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _produtos.length) {
      _produtos[indice].concluida = false;
      notifyListeners();
    }
  }

  // Método para excluir um produto com base no índice
  void excluirProduto(int indice) {
    if (indice >= 0 && indice < _produtos.length) {
      _produtos.removeAt(indice);
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para ordenar a lista de produtos por tipo
  void ordenarPorTipo() {
    _produtos.sort((a, b) => a.descricao.compareTo(b.descricao));
    notifyListeners();
  }

  // Método para ordenar a lista de produtos por ordem alfabética
  void ordenarPorAlfabetica() {
    _produtos.sort((a, b) => a.descricao.compareTo(b.descricao));
    notifyListeners();
  }
}
