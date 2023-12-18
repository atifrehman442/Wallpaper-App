import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  var isCheckSwitch = false.obs;
  RxInt indexNo = 0.obs;

  @override
  void onInit() {
    super.onInit();
    checkDarkModeStatus(); // Check the initial dark mode status
  }

  void toggleSwitch() {
    isCheckSwitch.value = !isCheckSwitch.value;
  }

  void toggleDarkMode() async {
    isDarkMode.value = !isDarkMode.value;
    // Save the dark mode status to shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode.value);
  }

  void checkDarkModeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
  }

  void indexCahange(int i) {
    indexNo.value = i;
  }
}
