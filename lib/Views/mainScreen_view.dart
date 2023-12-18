import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hd_pro_wallpaper/Controllers/theme_controller.dart';
import 'package:hd_pro_wallpaper/Views/home_view.dart';

import 'category_view.dart';

final selectScreen = [
  HomeView(),
  Category(),
];

class MainScreenView extends StatefulWidget {
  MainScreenView({super.key});

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView> {
  // RxInt indexNo = 0.obs;

  @override
  void initState() {
    final themeController = Get.put(ThemeController());
    if (themeController.isDarkMode.value == false)
      themeController.isCheckSwitch.value = true;
    // TODO: implement initState
    super.initState();
  }

  final themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.green, Colors.black])),
          ),
        ),
        body: Obx(() => selectScreen[themeController.indexNo.value]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: screenSize.height * 0.3,
                child: const DrawerHeader(
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.green, Colors.black])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/logo.png"),
                        maxRadius: 50,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Hd Pro Wallpaper',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  themeController.indexCahange(0);
                  // indexNo.value = 0;
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                title: const Text('Category'),
                onTap: () {
                  themeController.indexCahange(1);
                  // indexNo.value = 1;
                  Navigator.pop(context);
                },
              ),
              Divider(),
              // ListTile(
              //   title: const Row(
              //     children: [
              //       Icon(Icons.favorite_border),
              //       SizedBox(
              //         width: 5,
              //       ),
              //       Text('Favorite'),
              //     ],
              //   ),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
              // Divider(),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Text("Mode"),
                  const SizedBox(
                    width: 10,
                  ),
                  Obx(
                    () => Switch(
                      value: themeController.isCheckSwitch.value,
                      activeColor: Colors.green,
                      activeTrackColor: Colors.black,
                      inactiveTrackColor: Colors.green,
                      inactiveThumbColor: Colors.black,
                      onChanged: (bool newValue) {
                        themeController.toggleSwitch();
                        themeController.toggleDarkMode();
                        // Get.changeTheme(Get.isDarkMode
                        //     ? ThemeData.light()
                        //     : ThemeData.dark());
                        // themeController.isCheckSwitch.value = true;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
