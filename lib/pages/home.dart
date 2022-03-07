import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/loading.dart';
import 'package:weather_app/provider/weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var weatherProv = Provider.of<Weather>(context);
    var weather = weatherProv.listWeather.first;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const SizedBox(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const LoadingPage();
          }));
        }),
        child: const Icon(
          Icons.location_on_sharp,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              '${weather.temperature.toInt()}ºC',
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              weatherProv.getWeatherIcon(weather.id),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              weather.mess.toUpperCase(),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Text(
              'in',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              weather.location,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 40,
              width: double.infinity,
            ),
            Text(
              weatherProv.getMessage(weather.temperature.toInt()),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
