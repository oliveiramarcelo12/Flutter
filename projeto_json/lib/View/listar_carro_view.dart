import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projeto_json/Controller/carros_controller.dart';

class CarrosListarScreen extends StatefulWidget {
  const CarrosListarScreen({Key? key}) : super(key: key);

  @override
  State<CarrosListarScreen> createState() => _CarrosListarScreenState();
}

class _CarrosListarScreenState extends State<CarrosListarScreen> {
  CarrosController controller = CarrosController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Carros'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: FutureBuilder(
          future: controller.loadCarrosFromFile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar os carros.'),
              );
            } else {
              return ListView.builder(
                itemCount: controller.carroList.length,
                itemBuilder: (context, index) {
                  // Convert the foto string path to a File object
                  File fotoFile =
                      File(controller.carroList[index].foto);
                  return ListTile(
                    leading: Image.file(fotoFile),
                    title: Text(controller.carroList[index].modelo),
                    subtitle: Text(controller.carroList[index].marca),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
