import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home.dart';

import '../provider/weather.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0)).then((_) {
      Provider.of<Weather>(context, listen: false)
          .getCurrentWeather()
          .then((_) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const MyHomePage();
        }));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.indigo,
          size: 100,
        ),
      ),
    );
  }
}
