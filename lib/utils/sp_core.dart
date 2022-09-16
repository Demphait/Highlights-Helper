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

  static Future<void> setBoolAfk(bool? boolAfk) async {
    await _prefs.setBool('boolAfk', boolAfk ?? false);
  }

  static bool getBoolAfk() {
    return _prefs.getBool('boolAfk') ?? false;
  }

  static Future<void> delBoolAfk() async {
    await _prefs.remove('boolAfk');
  }
}
