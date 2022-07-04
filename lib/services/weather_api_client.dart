import 'dart:convert';

import 'package:http/http.dart'as http;

import '../model/weather_model.dart';

class WeatherApiClient{
  Future<Weather> ? getCurrentWeather(String location)async{
    var endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=31.5204&lon=74.3587&appid=a9e44cacd7a6bd0231b54ee1881f68d0&units=matrics");
    var response = await http.get(endpoint);
    var body =jsonDecode(response.body);
    print(Weather.fromjson(body).cityName);
    return Weather.fromjson(body);

  }
}