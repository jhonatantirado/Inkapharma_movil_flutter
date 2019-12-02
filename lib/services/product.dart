//import 'package:todo_app/services/location.dart';
import 'dart:convert';
import 'package:todo_app/utils/network_utils.dart';
import 'package:todo_app/model/product.dart';
import 'package:todo_app/services/webservice.dart';

const apiKey = '0f6dbc02cee2cd16bb57aeda2d9e1069';
const openWeatherMapURL = 'https://dycsw-inkapharmacy-netcore-api-anxious-echidna.cfapps.io/api/Products';
//?page=0&size=40

class ProductModel {

 static Resource<List<Product>> get all {
    
    return Resource(
      url: '$openWeatherMapURL?page=0&size=40',
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result['content'];
        return list.map((model) => 
            Product.fromJson(model)).toList();
      }
    );
  }




//  Future<dynamic> getProducts( {int page: 0, int size:50} ) async {
//      var url = '$openWeatherMapURL?page=$page&size=$size';
//      NetworkUtil networkHelper = NetworkUtil();
//      var weatherData = await networkHelper.get(url);
//      return weatherData;
//    }



  /*Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkUtil networkHelper = NetworkUtil();
    var weatherData = await networkHelper.get(url);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    String url = '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    NetworkUtil networkHelper = NetworkUtil();
    var weatherData = await networkHelper.get(url);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }*/

}