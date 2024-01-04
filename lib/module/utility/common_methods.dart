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