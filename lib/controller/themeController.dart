import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitman/theme/ThemeData.dart';
import 'package:gitman/utils/pref_utils.dart';

class ThemeController extends GetxController {
  bool _isDark = false;
  bool get isDark => _isDark;
  // synsyc valu from shared preferences
  @override // called when you use Get.put before running app
  void onInit() {
    super.onInit();
    sync();
  }

//
  void sync() async {
    bool value = await fetchBoolValuesSF('isDark');
    log(value.toString());
    _isDark = value ? true : false;
    update();
  }

  // toggle theme
  void toggleTheme() async {
    _isDark = !_isDark;
    // store value in shared preferences
//    storeBoolToSF("isDark", _isDark);
    if (_isDark) {
      Get.changeTheme(AppTheme().darkTheme);
    } else {
      Get.changeTheme(AppTheme().lightTheme);
    }
    update();
  }
}
