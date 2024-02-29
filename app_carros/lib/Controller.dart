import 'package:app_carros/Model.dart';

class CarrosController{
  List<Carro> _listaCarros = [];
  
  List<Carro> get listaCarros => _listaCarros;

  void adicionarCarro(String modelo, int ano, String imageUrl){
    Carro carro = Carro(modelo, ano, imagemUrl);
    _listaCarros.add(carro);
  }
}