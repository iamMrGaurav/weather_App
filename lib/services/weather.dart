import 'package:clima/services/networking.dart';

const apiKey = 'c8a7d27831f3c08cbab1e71ad88f9efa';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    Networking network = Networking(url);
    var weatherData = await network.getNetworkAPI();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
