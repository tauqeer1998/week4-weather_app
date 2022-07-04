import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/views/additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  Future<void>getData ()async {
    data = await client.getCurrentWeather("Karachi");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Weather App'),
        centerTitle: true,
      ),

      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return Column(
              children: [
                SizedBox(height: 20.0,),
                currentWeather(Icons.wb_sunny_rounded, '${data!.temp}', '${data!.cityName}'),
                SizedBox(
                  height: 20.0,
                ),
                Text("Additional Information",style: TextStyle(fontSize: 24.0,color: Colors.black26,fontWeight: FontWeight.bold),
                ),
                Divider(),
                SizedBox(height: 20.0,),
                additionalInformation("${data!.wind}", "${data!.humidity}", "${data!.pressure}", "${data!.feels_like}"),

              ],
            );
          }
          return Container();
        },
      )
    );
  }
}
