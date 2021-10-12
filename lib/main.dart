import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/controllers/bindings/auth_binding.dart';
import 'package:plant_signal/source/controllers/user_controller.dart';
import 'package:plant_signal/source/screen/WASplashScreen.dart';

import 'locale/Languages.dart';
import 'main/store/AppStore.dart';
import 'main/utils/AppTheme.dart';

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();
BaseLanguage? language;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Observer(
      builder: (_) => GetMaterialApp(
        initialBinding: AuthBinding(),
        debugShowCheckedModeBanner: false,
        title: 'Plant Signal',
        home: WASplashScreen(),
        theme: !appStore.isDarkModeOn
            ? AppThemeData.lightTheme
            : AppThemeData.darkTheme,
        navigatorKey: navigatorKey,
      ),
    );
  }
}
