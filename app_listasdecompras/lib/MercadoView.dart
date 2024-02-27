import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'MercadoController.dart';

class ListaMercadoScreen extends StatefulWidget {
  @override
  _ListaMercadoScreenState createState() => _ListaMercadoScreenState();
}

class _ListaMercadoScreenState extends State<ListaMercadoScreen> {
  final TextEditingController _descricaoController = TextEditingController();
  String? _selectedType;
  late TextEditingController _updateDescricaoController; // Alterado
  late TextEditingController _updateTipoController; // Alterado

  @override
  void initState() {
    super.initState();
    _updateDescricaoController = TextEditingController(); // Adicionado
    _updateTipoController = TextEditingController(); // Adicionado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 108, 241, 248), // Altera a cor de fundo para cinza
      appBar: AppBar(
        title: Text('Lista de Compras'), // Título da AppBar
        backgroundColor: Colors.grey, // Altera a cor de fundo do AppBar para cinza
        actions: [
          IconButton(
            icon: Icon(Icons.sort_by_alpha),
            onPressed: () {
              Provider.of<MercadoController>(context, listen: false)
                  .ordenarPorAlfabetica();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _descricaoController,
                    decoration: InputDecoration(
                      labelText: 'Nova Descrição',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedType,
                    items: Provider.of<MercadoController>(context)
                        .tiposDeProdutos
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedType = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Tipo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<MercadoController>(context, listen: false)
                        .adicionarProduto(
                            _descricaoController.text, _selectedType ?? '');
                    _descricaoController.clear();
                    setState(() {
                      _selectedType = null;
                    });
                  },
                  child: Text('Adicionar'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 242, 38, 38), // Altera a cor do botão para vermelho
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<MercadoController>(
              builder: (context, controller, _) {
                return ListView.builder(
                  itemCount: controller.produtos.length,
                  itemBuilder: (context, index) {
                    var produto = controller.produtos[index];
                    return Card(
                      elevation: 2,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        title: Text(produto.descricao),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Tipo: ${produto.tipo}'),
                            Text(
                                'Data: ${DateFormat('dd/MM/yyyy HH:mm').format(produto.dataHora)}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Excluir Produto'),
                                      content: Text(
                                          'Tem certeza de que deseja excluir este produto?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            controller.excluirProduto(index);
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Excluir'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            Checkbox(
                              value: produto.concluida,
                              onChanged: (value) {
                                if (value != null) {
                                  if (value) {
                                    controller.marcarComoConcluida(index);
                                  } else {
                                    controller.desmarcarComoConcluida(index);
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Atualizar Produto'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller:
                                          _updateDescricaoController, // Corrigido
                                      decoration: InputDecoration(
                                        labelText: 'Nova Descrição',
                                      ),
                                    ),
                                    DropdownButtonFormField<String>(
                                      value: produto.tipo,
                                      items: Provider.of<MercadoController>(
                                              context)
                                          .tiposDeProdutos
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          produto.tipo = newValue!;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Tipo',
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      controller.atualizarProduto(
                                          index,
                                          _updateDescricaoController
                                              .text, // Corrigido
                                          produto.tipo);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Atualizar'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
