import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutx/themes/app_theme.dart';
import 'package:flutx/themes/app_theme_notifier.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/AppThemeNotifier.dart';
import 'package:plant_signal/source/controllers/bindings/auth_binding.dart';
import 'package:plant_signal/source/controllers/user_controller.dart';
import 'package:plant_signal/source/screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'locale/Languages.dart';
import 'main/store/AppStore.dart';

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();
BaseLanguage? language;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<AppThemeNotifier>(
      create: (context) => AppThemeNotifier(),
      child: ChangeNotifierProvider<FxAppThemeNotifier>(
        create: (context) => FxAppThemeNotifier(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return Observer(
      builder: (_) => GetMaterialApp(
        initialBinding: AuthBinding(),
        debugShowCheckedModeBanner: false,
        title: 'Plant Signal',
        home: SplashScreen(),
        theme: FxAppTheme.getThemeFromThemeMode(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
