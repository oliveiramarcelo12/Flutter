import 'package:flutter/material.dart';

import '../controllers/produto_controllers.dart';
import '../models/produto.dart';

class CadastrarProdutosScreen extends StatefulWidget {
  const CadastrarProdutosScreen({super.key});

  @override
  State<CadastrarProdutosScreen> createState() =>
      _CadastrarProdutosScreenState();
}

class _CadastrarProdutosScreenState extends State<CadastrarProdutosScreen> {
  final ProdutosController _controller = ProdutosController();
  final TextEditingController _nomeText = TextEditingController();
  final TextEditingController _codigoText = TextEditingController();
  final TextEditingController _precoText = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.getProduto();
  }

  Future<void> _postProduto() async {
    Produto produto = Produto(
      id: (_controller.listProdutos.length + 1).toString(),
      nome: _nomeText.text,
      codigo: _codigoText.text,
      preco: double.parse(_precoText.text),
    );
    try {
      await _controller.postProduto(produto);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //tela de Cadastro de Produto
      appBar: AppBar(
        title: Text("Cadastro de Produto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nomeText,
              decoration: const InputDecoration(
                labelText: "Nome",
              ),
            ),
            TextField(
              controller: _codigoText,
              decoration: const InputDecoration(
                labelText: "Código",
              ),
            ),
            TextField(
              controller: _precoText,
              decoration: const InputDecoration(
                labelText: "Preço",
              ),
            ),
            ElevatedButton(
              onPressed: _cadastrar(),
              child: Text("Cadastrar"),
            ),
          ],
        ),
      ),
    );
  }
    _cadastrar() {
    return () {
      _postProduto();
      //clear
      _nomeText.clear();
      _codigoText.clear();
      _precoText.clear();
    };
  }
}



