import 'package:http/http.dart' as http;

const weatherApiBaseUrl =
    'https://api.open-meteo.com/v1/forecast?';

class HttpClient {
  var client = http.Client();

  Future<dynamic> getForecastApi(String parameters) async {
    var uri = Uri.parse(weatherApiBaseUrl + parameters);
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('HttpClient exception');
    }
  }
}
