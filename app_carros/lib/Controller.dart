import 'package:app_carros/Model.dart';

class CarroController{
  List<Carro> _carroLista = [];

  List<Carro> get listarCarros => _carroLista;

  void adicionarCarro(String modelo, int ano, String imagemUrl){
    Carro carro = Carro(modelo, ano, imagemUrl);
    _carroLista.add(carro);
  }
}