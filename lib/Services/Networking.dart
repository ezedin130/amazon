import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking {
  final String apiKey;

  Networking(this.apiKey);

  Future<Location?> fetchData() async {
    final url =
        'https://apiip.net/api/check?ip=67.250.186.196&accessKey=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Location(
          country: data['countryName'],
          city: data['cityName'],
        );
      }
    } catch (e) {
      print('Error fetching location: $e');
    }
    return null; // Return null if fetching fails
  }
}

class Location {
  final String? country;
  final String? city;

  Location({this.country, this.city});
}
