class WeatherDataModel {
  final int id;
  final String main;
  final String description;
  final String icon;
  final double temp;
  final int humidity;
  final double windSpeed;
  final String cityName;

  WeatherDataModel({
    this.id = 0,
    this.main = '',
    this.description = '',
    this.icon = '',
    this.temp = 0.0,
    this.humidity = 0,
    this.windSpeed = 0.0,
    this.cityName = '',
  });


  factory WeatherDataModel.fromJson(Map<String, dynamic> json) {

    final weatherList = json['weather'] as List?;
    final weatherMap = (weatherList != null && weatherList.isNotEmpty)
        ? weatherList[0]
        : null;

    return WeatherDataModel(

      id: weatherMap?['id'] ?? 0,
      main: weatherMap?['main'] ?? '',
      description: weatherMap?['description'] ?? '',
      icon: weatherMap?['icon'] ?? '',
      temp: (json['main']?['temp'] ?? 0.0).toDouble(),
      humidity: json['main']?['humidity'] ?? 0,
      windSpeed: (json['wind']?['speed'] ?? 0.0).toDouble(),
      cityName: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': cityName,
      'main': {
        'temp': temp,
        'humidity': humidity,
      },
      'wind': {
        'speed': windSpeed,
      },
      'weather': [
        {
          'id': id,
          'main': main,
          'description': description,
          'icon': icon,
        }
      ],
    };
  }


  static List<WeatherDataModel> fromJsonList(List<dynamic> data) {
    return data.map((item) {
      return WeatherDataModel(
        id: item['id'] ?? 0,
        main: item['main'] ?? '',
        description: item['description'] ?? '',
        icon: item['icon'] ?? '',
      );
    }).toList();
  }
}
