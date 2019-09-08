import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
    fetchPost();
  }

  void fetchPost() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');

    if (response.statusCode == 200) {
      String data = response.body;
      var temperature = jsonDecode(data)['main']['temp'];
      var idWeather = jsonDecode(data)['weather'][0]['id'];
      print('Temperature ' + temperature.toString());
      print('idWeather ' + idWeather.toString());
    }
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('Longitude ' +
        location.longitude.toString() +
        ' Latitude ' +
        location.latitude.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
