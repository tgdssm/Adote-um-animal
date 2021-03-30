import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pet_adoption_flutter_app/utils/keys.dart';

class GoogleGeocoding {

  static Future<String> reverseGeocoding(Position position) async{
    String url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleGeocoding';
    try {
      Response response = await Dio().get(url);
      var json = jsonDecode(jsonEncode(response.data));
      String city = json['plus_code']['compound_code'].split(',')[1];
      print(city);
      return city;
    } catch (e) {
      print(e);
    }
  }
}