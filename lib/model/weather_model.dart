class WeatherModel {
  final double temperature;
  final double longtitude;
  final double latitude;
  final String mess;
  final int id;
  final String location;

  WeatherModel({
    required this.temperature,
    required this.id,
    required this.mess,
    required this.latitude,
    required this.longtitude,
    required this.location,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['name'] ?? 'Null',
      mess: json['weather'][0]['description'] ?? 'Null',
      temperature: json['main']['temp'] ?? 0,
      id: json['weather'][0]['id'] ?? 0,
      longtitude: json['coord']['lon'] ?? 0,
      latitude: json['coord']['lat'] ?? 0,
    );
  }
}
