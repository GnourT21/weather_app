import 'package:dio/dio.dart';

class Networking {
  final String url;

  Networking(this.url);

  Future<dynamic> fetchData() async {
    var response = await Dio().get(url);
    if (response.statusCode == 200) {
      var data = response.data as Map<String, dynamic>;
      return data;
    }
  }
}
