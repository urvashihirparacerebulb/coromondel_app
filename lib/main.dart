import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'module/controllers/app_binding/app_binding_controllers.dart';
import 'module/controllers/general_controller.dart';
import 'module/splash/splash_view.dart';
import 'module/theme/theme_service.dart';
import 'module/utility/common_methods.dart';
import 'module/utility/constants.dart';

final getPreferences = GetStorage();

pref() async {
  await GetStorage.init();
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await pref();
  if (readThemePref() == systemDefault) {
    if (SchedulerBinding.instance.window.platformBrightness ==
        Brightness.dark) {
      ThemeService().saveThemeToBox(true);
    } else {
      ThemeService().saveThemeToBox(false);
    }
  }
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode:
      ThemeService().loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver{

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(const Duration(milliseconds: 10), () {
      GeneralController.to.isDarkMode.value = ThemeService().loadThemeFromBox();
    });
    // Timer(const Duration(seconds: 2), () {
    //   if (getIsLogin()) {
    //     Get.off(() => const CommonDashboard());
    //   } else {
    //     Get.off(() => const LoginScreen());
    //   }
    // });
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    if (readThemePref() == systemDefault) {
      systemDefaultTheme();
    }
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}


