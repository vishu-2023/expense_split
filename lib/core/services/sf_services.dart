import 'package:shared_preferences/shared_preferences.dart';
import 'package:split_expense/core/models/get_user_model.dart';

class SFServices {
  SFServices._();
  static final SFServices _services = SFServices._();
  factory SFServices() => _services;

  static late SharedPreferences _sharedPreferences;
  static Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setUser(GetUserModel user) async {
    await _sharedPreferences.setString("user", "$user");
  }
}
