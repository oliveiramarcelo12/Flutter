class City {
  final String cityName;
  final int favoriteCities;

  City({required this.cityName, required this.favoriteCities});

  Map<String, dynamic> toMap() {
    return {
      'cityname': cityName.toLowerCase(), // Ensure city names are stored in lowercase
      'favoritecities': favoriteCities,
    };
  }

  static City fromMap(Map<String, dynamic> map) {
    return City(
      cityName: map['cityname'],
      favoriteCities: map['favoritecities'],
    );
  }
}
