import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hd_pro_wallpaper/Views/mainScreen_view.dart';

import 'Controllers/theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          theme: themeController.isDarkMode.value
              ? ThemeData.dark()
              : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: MainScreenView(),
        ));
  }
}
