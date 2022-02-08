class Weather{
  late final double temp;
  late final double feelsLike;
  late final double low;
  late final double high;
  late final String description;
  late final String icon;

  Weather({required this.temp, required this.feelsLike, required this.low, required this.high, required this.description, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
    );
  }
}