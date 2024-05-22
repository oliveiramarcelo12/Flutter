import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';

class DetailsWeatherScreen extends StatefulWidget {
  final String city;
  const DetailsWeatherScreen({super.key, required this.city});


  @override
  State<DetailsWeatherScreen> createState() => _DetailsWeatherScreenState();
}

class _DetailsWeatherScreenState extends State<DetailsWeatherScreen> {
  final WeatherController _controller = WeatherController();
  
  @override
  void initState() {
    super.initState();
    _controller.getWeather(widget.city);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: _controller.weatherList.isEmpty 
          ?
          Text("Erro de Conexão"),
          I
          :
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Row(
                children: [
                  Text(_controller.weatherList.last.name),
                  //icon favorite
                  IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: (){
                      //criar método para favoritar
                    },
                  )
                ],
              ),
              Text(_controller.weatherList.last.main),
              Text(_controller.weatherList.last.description),
              Text((_controller.weatherList.last.temp-273).toStringAsFixed(2))
            ]
          )
        )
      )

    );
  }
}