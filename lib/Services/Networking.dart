// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking {
  final String apiKey;
  double? latitude;
  double? longitude;

  Networking(this.apiKey, this.latitude, this.longitude);

  Future<dynamic> fetchData() async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data;
      }
    } catch (e) {
      print('Error fetching location: $e');
    }
    return null; // Return null if fetching fails
  }
}
