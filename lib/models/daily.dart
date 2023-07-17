class Daily {
  List<DateTime> time;
  List<double> temperature2MMax;
  List<double> temperature2MMin;
  List<int> precipitationProbabilityMean;
  List<int> weathercode;
  List<String> sunrise;
  List<String> sunset;

  Daily({
    required this.time,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.precipitationProbabilityMean,
    required this.weathercode,
    required this.sunrise,
    required this.sunset,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
        temperature2MMax: List<double>.from(
            json["temperature_2m_max"].map((x) => x?.toDouble())),
        temperature2MMin: List<double>.from(
            json["temperature_2m_min"].map((x) => x?.toDouble())),
        precipitationProbabilityMean: List<int>.from(
            json["precipitation_probability_mean"].map((x) => x)),
        weathercode: List<int>.from(json["weathercode"].map((x) => x)),
        sunrise: List<String>.from(json["sunrise"].map((x) => x)),
        sunset: List<String>.from(json["sunset"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) =>
            "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "temperature_2m_max":
            List<dynamic>.from(temperature2MMax.map((x) => x)),
        "temperature_2m_min":
            List<dynamic>.from(temperature2MMin.map((x) => x)),
        "precipitation_probability_mean":
            List<dynamic>.from(precipitationProbabilityMean.map((x) => x)),
        "weathercode": List<dynamic>.from(weathercode.map((x) => x)),
        "sunrise": List<dynamic>.from(sunrise.map((x) => x)),
        "sunset": List<dynamic>.from(sunset.map((x) => x)),
      };
}
