import 'package:geolocator/geolocator.dart';

class Location {
  double? longtitude;
  double? latitude;
  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longtitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      throw e.toString();
    }
  }
}
