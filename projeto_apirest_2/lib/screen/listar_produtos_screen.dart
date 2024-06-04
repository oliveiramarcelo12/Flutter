import 'package:flutter/material.dart';
import 'package:projeto_apirest_2/controllers/produto_controllers.dart';

class ListarProdutosScreen extends StatefulWidget {
  const ListarProdutosScreen({super.key});

  @override
  State<ListarProdutosScreen> createState() => _ListarProdutosScreenState();
}

class _ListarProdutosScreenState extends State<ListarProdutosScreen> {
  final ProdutosController _controller = ProdutosController();
  Future<void> _getProdutos() async {
    try {
      await _controller.getProduto();
    } catch (e) {
      print(e);
    }
  }

  @override
Widget build(BuildContext context) {
    return Scaffold(
      // future.builder lista produtos
      body: FutureBuilder(
        future: _getProdutos(),
        builder: (context, snapshot) {
          if (_controller.listProdutos.isNotEmpty) {
            return ListView.builder(
              itemCount: _controller.listProdutos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_controller.listProdutos[index].nome),
                  subtitle: Text(_controller.listProdutos[index].codigo),
                );
              },
            );
          } else if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}