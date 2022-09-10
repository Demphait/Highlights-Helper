import 'package:shared_preferences/shared_preferences.dart';

abstract class SpCore {
  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setStartAfk(String? startAfk) async {
    await _prefs.setString('startAfk', startAfk ?? '');
  }

  static String getStartAfk() {
    return _prefs.getString('startAfk') ?? '';
  }

  static Future<void> delStartAfk() async {
    await _prefs.remove('startAfk');
  }
}
