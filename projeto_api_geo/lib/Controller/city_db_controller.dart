import '../Model/city_model.dart';
import '../Service/city_db_service.dart';

class CityDbController {
  final CityDataBaseService _dbService = CityDataBaseService();

  List<City> _cities = []; // Lista de cidades

  Future<void> addCity(City city) async {
    await _dbService.insertCity(city);
    await listCities(); // Após adicionar, atualiza a lista
  }

  Future<void> removeCity(String cityName) async {
    await _dbService.deleteCity(cityName);
    await listCities(); // Após remover, atualiza a lista
  }

  Future<void> listCities() async {
    final maps = await _dbService.getAllCities();
    _cities = maps.map((map) => City.fromMap(map)).toList(); // Converte os dados do banco para objetos City
  }

  List<City> cities() {
    return _cities; // Retorna a lista atual de cidades
  }
}
