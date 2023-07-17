class Hourly {
  List<String> time;
  List<double> temperature2M;
  List<int> precipitationProbability;
  List<int> weathercode;
  List<int> isDay;
  List<double> apparentTemperature;
  List<int> relativehumidity2M;
  List<int> visibility;
  List<double> precipitation;
  List<int> snowfall;
  List<double> windspeed10M;
  List<int> winddirection10M;
  List<double> surfacePressure;

  Hourly({
    required this.time,
    required this.temperature2M,
    required this.precipitationProbability,
    required this.weathercode,
    required this.isDay,
    required this.apparentTemperature,
    required this.relativehumidity2M,
    required this.visibility,
    required this.precipitation,
    required this.snowfall,
    required this.windspeed10M,
    required this.winddirection10M,
    required this.surfacePressure,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: List<String>.from(json["time"].map((x) => x)),
        temperature2M:
            List<double>.from(json["temperature_2m"].map((x) => x?.toDouble())),
        precipitationProbability:
            List<int>.from(json["precipitation_probability"].map((x) => x)),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        isDay: List<int>.from(json["is_day"].map((x) => x)),
        apparentTemperature: List<double>.from(
            json["apparent_temperature"].map((x) => x?.toDouble())),
        relativehumidity2M:
            List<int>.from(json["relativehumidity_2m"].map((x) => x)),
        visibility: List<int>.from(json["visibility"].map((x) => x)),
        precipitation:
            List<double>.from(json["precipitation"].map((x) => x?.toDouble())),
        snowfall: List<int>.from(json["snowfall"].map((x) => x)),
        windspeed10M:
            List<double>.from(json["windspeed_10m"].map((x) => x?.toDouble())),
        winddirection10M:
            List<int>.from(json["winddirection_10m"].map((x) => x)),
        surfacePressure: List<double>.from(
            json["surface_pressure"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => x)),
        "temperature_2m": List<dynamic>.from(temperature2M.map((x) => x)),
        "precipitation_probability":
            List<dynamic>.from(precipitationProbability.map((x) => x)),
        "weathercode": List<dynamic>.from(weathercode.map((x) => x)),
        "is_day": List<dynamic>.from(isDay.map((x) => x)),
        "apparent_temperature":
            List<dynamic>.from(apparentTemperature.map((x) => x)),
        "relativehumidity_2m":
            List<dynamic>.from(relativehumidity2M.map((x) => x)),
        "visibility": List<dynamic>.from(visibility.map((x) => x)),
        "precipitation": List<dynamic>.from(precipitation.map((x) => x)),
        "snowfall": List<dynamic>.from(snowfall.map((x) => x)),
        "windspeed_10m": List<dynamic>.from(windspeed10M.map((x) => x)),
        "winddirection_10m": List<dynamic>.from(winddirection10M.map((x) => x)),
        "surface_pressure": List<dynamic>.from(surfacePressure.map((x) => x)),
      };
}
