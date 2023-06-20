import 'dart:developer';

import 'package:get/get.dart';
import 'package:gitman/utils/pref_utils.dart';

class ThemeController extends GetxController {
  bool _isDark = false;
  bool get isDark => _isDark;
  // synsyc valu from shared preferences

  void sync() async {
    bool value = await fetchBoolValuesSF('isDark');
    log(value.toString());
    _isDark = value;
  }

  // toggle theme
  void toggleTheme() async {}
}
