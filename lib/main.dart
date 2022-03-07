import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/loading.dart';
import 'package:weather_app/provider/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Weather(),
        builder: (context, widget) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.dark(),
            home: const LoadingPage(),
          );
        });
  }
}