import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/network.dart';

const apiKey = 'c16f0bf7594009bca5f9ae16ac94846f';
String url = 'https://api.openweathermap.org/data/2.5/weather?';

// lat={lat}&lon={lon}&appid={API key}
class Weather with ChangeNotifier {
  List<WeatherModel> _list = [];
  List<WeatherModel> get listWeather => _list;

  Future<void> getCurrentWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    try {
      Networking networking = Networking(
          '${url}lat=${location.latitude}&lon=${location.longtitude}&appid=$apiKey&units=metric');
      var weatherData = await networking.fetchData();
      List<WeatherModel> listTemp = [];
      listTemp.add(WeatherModel.fromJson(weatherData));
      _list = listTemp;
    } catch (e) {
      throw e.toString();
    }
    notifyListeners();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
