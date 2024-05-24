import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';

import '../Model/city_model.dart';
import '../Service/city_db_weather.dart';

class DetailsWeatherScreen extends StatefulWidget {
  final String city;
  const DetailsWeatherScreen({super.key, required this.city});

  @override
  State<DetailsWeatherScreen> createState() => _DetailsWeatherScreenState();
}

class _DetailsWeatherScreenState extends State<DetailsWeatherScreen> {
  final WeatherController _controller = WeatherController();
   final CityDataBaseService _dbService = CityDataBaseService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: FutureBuilder(
                    future: _controller.getWeather(widget.city),
                    builder: (context, snapshot) {
                      if (_controller.weatherList.isEmpty) {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            //inserir botão de refresh
                          ],
                        );
                      } else {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(_controller.weatherList.last.name),
                                  //icon favorite
                                  IconButton(
                                    icon: const Icon(Icons.favorite),
                                    onPressed: () {
                                      //criar método para favoritar
                                      City cidade = City(
                                          cityName: widget.city,
                                          favoriteCities: true);
                                      _dbService.updateCity(cidade);
                                    },
                                  )
                                ],
                              ),
                              Text(_controller.weatherList.last.main),
                              Text(_controller.weatherList.last.description),
                              Text((_controller.weatherList.last.temp - 273)
                                  .toStringAsFixed(2))
                            ]);
                      }
                    }))));
  }
}
