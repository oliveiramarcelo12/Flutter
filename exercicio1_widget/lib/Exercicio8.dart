import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String description;
  final String imageUrl;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class MyApp extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Notebook Acer',
      description: 'Notebook Acer Predator Triton Intel Core i7, RAM 16GB, RTX 3060, SSD 512GB, 16 Polegadas',
      imageUrl: 'https://images.kabum.com.br/produtos/fotos/sync_mirakl/421179/Notebook-Acer-Predator-Triton-Intel-Core-i7-RAM-16GB-RTX-3060-SSD-512GB-16-Polegadas-Windows-11-Home_1675178929_m.jpg',
    ),
    Product(
      name: 'Robô Aspirador de Pó',
      description: 'Descrição do Produto 2',
      imageUrl: 'https://images.kabum.com.br/produtos/fotos/114195/robo-aspirador-de-po-kabum-smart-wi-fi_1602000476_gg.jpg',
    ),
    Product(
      name: 'Mesa Office',
      description: 'Descrição do Produto 3',
      imageUrl: 'https://images.kabum.com.br/produtos/fotos/471961/mesa-office-kabum-tech-dt900-branca-e-madeira-regulagem-de-altura-automatica-memorizacao-4-usuarios-anti-esmagamento-ktdt900brmn_1702920948_gg.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Cards Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Produtos'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Image.network(products[index].imageUrl),
                title: Text(products[index].name),
                subtitle: Text(products[index].description),
                onTap: () {
                  // Implemente ação ao tocar no card, se necessário
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
