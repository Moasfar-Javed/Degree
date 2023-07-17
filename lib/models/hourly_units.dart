class HourlyUnits {
  String time;
  String temperature2M;
  String precipitationProbability;
  String weathercode;
  String isDay;
  String apparentTemperature;
  String relativehumidity2M;
  String visibility;
  String precipitation;
  String snowfall;
  String windspeed10M;
  String winddirection10M;
  String surfacePressure;

  HourlyUnits({
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

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json["time"],
        temperature2M: json["temperature_2m"],
        precipitationProbability: json["precipitation_probability"],
        weathercode: json["weathercode"],
        isDay: json["is_day"],
        apparentTemperature: json["apparent_temperature"],
        relativehumidity2M: json["relativehumidity_2m"],
        visibility: json["visibility"],
        precipitation: json["precipitation"],
        snowfall: json["snowfall"],
        windspeed10M: json["windspeed_10m"],
        winddirection10M: json["winddirection_10m"],
        surfacePressure: json["surface_pressure"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m": temperature2M,
        "precipitation_probability": precipitationProbability,
        "weathercode": weathercode,
        "is_day": isDay,
        "apparent_temperature": apparentTemperature,
        "relativehumidity_2m": relativehumidity2M,
        "visibility": visibility,
        "precipitation": precipitation,
        "snowfall": snowfall,
        "windspeed_10m": windspeed10M,
        "winddirection_10m": winddirection10M,
        "surface_pressure": surfacePressure,
      };
}
