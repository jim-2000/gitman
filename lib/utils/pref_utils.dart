import 'package:shared_preferences/shared_preferences.dart';

storeBoolToSF(String boolKey, bool boolVal) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(boolKey, boolVal);
}

Future<bool> fetchBoolValuesSF(String boolKey) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
//Return bool
  return prefs.getBool(boolKey) ?? false;
}

Future<void> clearValueFromSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}
