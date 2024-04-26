import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_services.dart';

class WeatherPage extends StatefulWidget {

  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api Key
  final _weatherServices = WeatherServices('4e0e079583dc0430506afc388d6fa270');

  Weather? _weather;

  //fetch Data
  _fetchWeather() async {
    String cityName = await _weatherServices.getCurrentCity();

    try{
      final weather = await _weatherServices.getWeather(cityName);

      setState(() { _weather = weather; });

    }
    catch(e){
      print(e);
    }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Herllo');
    _fetchWeather();
  }

  // weather animations
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_weather?.cityName ?? "Loading... city",textAlign: TextAlign.center),
          Text("${_weather?.temperature.round()} 'C",textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
