import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';

const apiKey = "68ac566293fc128750766f3d4d84a411";
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    String apiUrl =
        '$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(apiUrl);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩️';
    } else if (condition < 400) {
      return '🌧️';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '❄️';
    } else if (condition < 800) {
      return '🌫️';
    } else if (condition == 800) {
      return '🌞';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍♂️';
    }
  }

  String getMessage(int temp) {
    if (temp > 30) {
      return 'It\'s scorching outside! Time for some chilled lassi! 🍹🌞';
    } else if (temp > 25) {
      return 'Grab your shades and show off those 👕, it\'s sizzling outside! 😎';
    } else if (temp < 5) {
      return 'Bundle up like a burrito! 🌯 You\'ll need 🧣 and 🧤';
    } else {
      return 'Weather forecast: Like a IPL match, unpredictable! Bring a 🧥 just in case!';
    }
  }
}
