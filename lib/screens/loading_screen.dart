import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location_screen.dart';

const apiKey = 'c8a7d27831f3c08cbab1e71ad88f9efa';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude;
  double latitude;
  @override
  void initState() {
    // TODO: implement initState

    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getRealTimeLocation();

    longitude = location.longitude;
    latitude = location.latitude;

    String url =
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    Networking network = Networking(url);
    var weatherData = await network.getNetworkAPI();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
