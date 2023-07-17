import 'package:intl/intl.dart';
import 'package:degree/models/forecast.dart';
import 'package:degree/services/defined_exceptions.dart';
import 'package:degree/services/http_client.dart';

class WeatherService {
  Forecast? forecast;

  Future<void> getWeatherForecast() async {
    const lat = '24.9070221';
    const long = '67.1113825';
    const unit = 'celsius';

    const params =
        'latitude=$lat&longitude=$long&timezone=auto&temperature_unit=$unit&current_weather=true&hourly=temperature_2m,precipitation_probability,weathercode,is_day,apparent_temperature,relativehumidity_2m,visibility,precipitation,precipitation_probability,snowfall,windspeed_10m,winddirection_10m,surface_pressure&daily=temperature_2m_max,temperature_2m_min';

    final jsonForecastData =
        await HttpClient().getForecastApi(params).catchError((e) {});

    if (jsonForecastData == null) throw NoItemsException();

    forecast = Forecast.fromJson(jsonForecastData);
  }

  String weatherFromCode(int code) {
    switch (code) {
      case 1:
        {
          return 'Mostly Clear';
        }
      case 2:
        {
          return 'Partly Cloudy';
        }
      case 3:
        {
          return 'Overcast';
        }
      case 45 || 48:
        {
          return 'Fog';
        }
      case 51 || 53 || 55 || 56 || 57:
        {
          return 'Drizzle';
        }
      case 61 || 63:
        {
          return 'Slight Rain';
        }
      case 65 || 66 || 67:
        {
          return 'Heavy Rain';
        }
      case 71 || 73 || 75 || 77:
        {
          return 'Snowfall';
        }
      case 80 || 81 || 82:
        {
          return 'Rain Showers';
        }
      case 85 || 86:
        {
          return 'Snow Showers';
        }
      case 95:
        {
          return 'Thunderstorms';
        }
      default:
        {
          return 'Clear Skies';
        }
    }
  }

  String weatherImagePath(int code, int isDay) {
    if (isDay == 0) {
      switch (code) {
        case 2:
          {
            return 'assets/images/night.png';
          }
        case 3 || 45 || 48:
          {
            return 'assets/images/night_cloud.png';
          }
        case 51 || 53 || 55 || 56 || 57 || 61 || 63:
          {
            return 'assets/images/night_rain.png';
          }
        case 65 || 66 || 67 || 71 || 73 || 75 || 77:
          {
            return 'assets/images/rain.png';
          }
        case 80 || 81 || 82 || 85 || 86 || 95:
          {
            return 'assets/images/heavyrain_storm.png';
          }
        default:
          {
            return 'assets/images/night_clear.png';
          }
      }
    } else {
      switch (code) {
        case 2:
          {
            return 'assets/images/sunny.png';
          }
        case 3 || 45 || 48:
          {
            return 'assets/images/cloudy.png';
          }
        case 51 || 53 || 55 || 56 || 57 || 61 || 63:
          {
            return 'assets/images/cloudy_rainy.png';
          }
        case 65 || 66 || 67 || 71 || 73 || 75 || 77:
          {
            return 'assets/images/rain.png';
          }
        case 80 || 81 || 82 || 85 || 86 || 95:
          {
            return 'assets/images/heavyrain_storm.png';
          }
        default:
          {
            return 'assets/images/clear.png';
          }
      }
    }
  }

  List<String> weatherListFromCodes(List codes) {
    List<String> weatherList = codes.map((code) {
      return weatherFromCode(code);
    }).toList();

    return weatherList;
  }

  List<String> weatherImageListFromCodes(List codes, List isDays) {
    List<String> imagePathList = List<String>.generate(codes.length, (index) {
      int code = codes[index];
      int isDay = isDays[index];
      return weatherImagePath(code, isDay);
    });

    return imagePathList;
  }

  List<String> hourListFromTimes(List times) {
    List<String> hours = [];

    for (String time in times) {
      DateTime dateTime = DateTime.parse(time);
      String formattedHour = DateFormat('h a').format(dateTime);
      hours.add(formattedHour);
    }

    return hours;
  }

  List<String> dayListFromTimes(List times) {
    List<String> daysOfWeek = [];
    for (String time in times) {
      DateTime dateTime = DateTime.parse(time);
      String formattedDayOfWeek = DateFormat('EEEE').format(dateTime);
      daysOfWeek.add(formattedDayOfWeek);
    }
    return daysOfWeek;
  }

  Map<String, dynamic> currentWeather() {
    int currentHour = DateTime.now().hour;
    Map<String, dynamic> currentWeather = {
      'temprature': forecast!.currentWeather.temperature.ceil(),
      'apparentTemprature':
          forecast!.hourly.apparentTemperature[currentHour + 1].ceil(),
      'lowestTemprature': forecast!.daily.temperature2MMin[0],
      'highestTemprature': forecast!.daily.temperature2MMax[0],
      'weatherFromCode': weatherFromCode(forecast!.currentWeather.weathercode),
      'weatherImagePath': weatherImagePath(
          forecast!.currentWeather.weathercode, forecast!.currentWeather.isDay),
      'rainChances': forecast!.hourly.precipitationProbability[currentHour + 1],
      'precipitation': forecast!.hourly.precipitation[currentHour + 1],
      'windSpeed': forecast!.hourly.windspeed10M[currentHour + 1],
      'windDirection': forecast!.hourly.windspeed10M[currentHour + 1],
      'humidity': forecast!.hourly.relativehumidity2M[currentHour + 1],
      'visibility': forecast!.hourly.visibility[currentHour + 1],
      'surfacePressure': forecast!.hourly.surfacePressure[currentHour + 1],
      'sunrise': forecast!.daily.sunrise[0],
      'sunset': forecast!.daily.sunset[0]
    };

    return currentWeather;
  }

  Map<String, List> hourlyWeather() {
    int currentHour = DateTime.now().hour;

    Map<String, List> hourlyWeather = {
      'hours': hourListFromTimes(forecast!.hourly.time),
      'tempratures':
          forecast!.hourly.temperature2M.sublist(currentHour + 1, 10),
      'weathersFromCodes': weatherListFromCodes(
          forecast!.hourly.weathercode.sublist(currentHour + 1, 10)),
      'weatherImagePaths': weatherImageListFromCodes(
          forecast!.hourly.weathercode.sublist(currentHour + 1, 10),
          forecast!.hourly.isDay.sublist(currentHour + 1, 10)),
      'rainChances': forecast!.hourly.precipitationProbability
          .sublist(currentHour + 1, 10),
    };

    return hourlyWeather;
  }

  Map<String, List> dailyWeather() {
    List<int> days = forecast!.daily.weathercode.map((e) {
      return 1;
    }).toList();

    Map<String, List> dailyWeather = {
      'days': dayListFromTimes(forecast!.daily.time),
      'weathersFromCodes': weatherListFromCodes(forecast!.daily.weathercode),
      'rainChances': forecast!.daily.precipitationProbabilityMean,
      'weatherImagesPaths':
          weatherImageListFromCodes(forecast!.daily.weathercode, days),
      'highestTemprature': forecast!.daily.temperature2MMax,
      'lowestTemprature': forecast!.daily.temperature2MMin,
    };

    return dailyWeather;
  }
}
