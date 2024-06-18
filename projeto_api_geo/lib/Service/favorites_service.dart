import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Model/city_model.dart'; // Certifique-se de ajustar o caminho conforme necessário

class FavoritesService {
  static const String _favoritesKey = 'favoriteCities';

  Future<void> addFavorite(City city) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.add(city);
    final List<String> favoriteCitiesStrings = favorites.map((city) => jsonEncode(city.toMap())).toList();
    await prefs.setStringList(_favoritesKey, favoriteCitiesStrings);
  }

  Future<void> removeFavorite(City city) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    favorites.removeWhere((item) => item.cityName == city.cityName);
    final List<String> favoriteCitiesStrings = favorites.map((city) => jsonEncode(city.toMap())).toList();
    await prefs.setStringList(_favoritesKey, favoriteCitiesStrings);
  }

  Future<List<City>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? favoriteCitiesStrings = prefs.getStringList(_favoritesKey);
    if (favoriteCitiesStrings != null) {
      return favoriteCitiesStrings.map((cityString) => City.fromMap(jsonDecode(cityString))).toList();
    }
    return [];
  }
}
