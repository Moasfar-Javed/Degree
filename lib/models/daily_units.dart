class DailyUnits {
  String time;
  String temperature2MMax;
  String temperature2MMin;
  String precipitationProbabilityMean;
  String weathercode;
  String sunrise;
  String sunset;

  DailyUnits({
    required this.time,
    required this.temperature2MMax,
    required this.temperature2MMin,
    required this.precipitationProbabilityMean,
    required this.weathercode,
    required this.sunrise,
    required this.sunset,
  });

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json["time"],
        temperature2MMax: json["temperature_2m_max"],
        temperature2MMin: json["temperature_2m_min"],
        precipitationProbabilityMean: json["precipitation_probability_mean"],
        weathercode: json["weathercode"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m_max": temperature2MMax,
        "temperature_2m_min": temperature2MMin,
        "precipitation_probability_mean": precipitationProbabilityMean,
        "weathercode": weathercode,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}
