import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '../Controller/weather_controller.dart';

class DetailsWeatherScreen extends StatefulWidget {
  final String city;
  const DetailsWeatherScreen({super.key, required this.city});

  @override
  State<DetailsWeatherScreen> createState() => _DetailsWeatherScreenState();
}

class _DetailsWeatherScreenState extends State<DetailsWeatherScreen> {
  final WeatherController _controller = WeatherController();
  late Future<void> _weatherFuture;

  @override
  void initState() {
    super.initState();
    _weatherFuture = _loadWeather();
  }

  Future<void> _loadWeather() async {
    await _controller.getWeather(widget.city);
    setState(() {});
  }

  String _getAnimationFile(String weatherDescription) {
    if (weatherDescription.contains('clear')) {
      return 'assets/animations/clear.riv';
    } else if (weatherDescription.contains('cloud')) {
      return 'assets/animations/cloudy.riv';
    } else if (weatherDescription.contains('rain')) {
      return 'assets/animations/rainy.riv';
    }
    // Adicione outras condições conforme necessário
    return 'assets/animations/default.riv'; // Certifique-se de ter um arquivo default.riv
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
          child: FutureBuilder<void>(
            future: _weatherFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Erro de Conexão"),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        setState(() {
                          _weatherFuture = _loadWeather();
                        });
                      },
                    ),
                  ],
                );
              } else if (_controller.weatherList.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Nenhuma informação disponível"),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        setState(() {
                          _weatherFuture = _loadWeather();
                        });
                      },
                    ),
                  ],
                );
              } else {
                final weather = _controller.weatherList.last;
                final animationFile = _getAnimationFile(weather.description.toLowerCase());

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Exibir a animação correspondente
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: RiveAnimation.asset(
                        animationFile,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(weather.name),
                    const SizedBox(height: 10),
                    Text(weather.main),
                    const SizedBox(height: 10),
                    Text(weather.description),
                    const SizedBox(height: 10),
                    Text((weather.temp - 273).toStringAsFixed(2)),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        setState(() {
                          _weatherFuture = _loadWeather();
                        });
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
