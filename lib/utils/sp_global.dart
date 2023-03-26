import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal {
  static final SPGlobal _instance = SPGlobal._();
  SPGlobal._();
  factory SPGlobal() {
    return _instance;
  }
  late SharedPreferences prefs;
  initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  setString(String key, String value) {
    prefs.setString(key, value);
  }

  String getString(String key) {
    return prefs.getString(key) ?? "No encontrado";
  }

  setBool(String key, bool value) {
    prefs.setBool(key, value);
  }

  bool getBool(String key) {
    return prefs.getBool(key) ?? false;
  }
}
