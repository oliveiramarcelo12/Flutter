import 'dart:convert';

import '../models/produto.dart';
import 'package:http/http.dart' as http;

class ProdutosController {
  List<Produto> _listProdutos = [];
  List<Produto> get listProdutos => _listProdutos;
  //getProdutoFromJson
  Future<List<Produto>> getProduto() async {
    final response =
        await http.get(Uri.parse('http://10.109.204.51:3000/produtos'));
    if (response.statusCode == 200) {
      List<dynamic> _result = json.decode(response.body);
      _listProdutos = _result.map((e) => Produto.fromJson(e)).toList();
      return _listProdutos;
    } else {
      throw Exception('Não foi possível conectar com o servidor');
    }
  }

  //postProdutoToJson
  Future<String> postProduto(Produto produto) async {
    final response = await http.post(
        Uri.parse('http://10.109.204.51:3000/produtos'),
        body: json.encode(produto.toJson()),
        headers:{'Content-Type': 'application/json'}
        );
    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Não foi possível conectar com o servidor');
    }
  }
}
