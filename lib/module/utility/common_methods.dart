import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../configurations/config_file.dart';
import '../../main.dart';
import 'constants.dart';

isNotEmptyString(String? string) {
  return string != null && string.isNotEmpty;
}

writeDataInPref({required String key, required bool value}) {
  getPreferences.write(key, value);
}

bool readDataFromPref(String key) {
  return getPreferences.read(key) ?? false;
}

writeThemePref({required value}) {
  getPreferences.write("theme", value);
}

readThemePref() {
  return getPreferences.read("theme") ?? ThemeSettingEnum.SystemDefault;
}

setIsLogin({required bool isLogin}) {
  getPreferences.write('isLogin', isLogin);
}

bool getIsLogin() {
  return (getPreferences.read('isLogin') ?? false);
}

showSnackBar({String title = "", required String message}) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: title.isEmpty || title == ApiConfig.warning
          ? const Color(0xffFFCC00)
          : title == ApiConfig.success
          ? Colors.green
          : Colors.red,
      textColor: Colors.white,
      fontSize: 12.0);
}