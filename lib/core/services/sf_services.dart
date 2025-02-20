import 'package:shared_preferences/shared_preferences.dart';

class SFServices {
  SFServices._();
  static final SFServices _services = SFServices._();
  factory SFServices() => _services;

  static late SharedPreferences _sharedPreferences;
  static Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<void> setUser() async {
    //await _sharedPreferences.setString();
  }
 
}
