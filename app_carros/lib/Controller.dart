import 'package:app_carros/Model.dart';

class CarroController{
  List<Carro> _carroLista = [
     Carro("Fiat Uno",1992,"caminho da imagem"),
     Carro("Classic",2012,"caminho da imagem")

  ];
 
  List<Carro> get listarCarros => _carroLista;

  void adicionarCarro(String modelo, int ano, String imagemUrl){
    Carro carro = Carro(modelo, ano, imagemUrl);
    _carroLista.add(carro);
  }
}