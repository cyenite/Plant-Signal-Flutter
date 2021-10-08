import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_signal/source/screen/WASplashScreen.dart';

import 'locale/Languages.dart';
import 'main/store/AppStore.dart';
import 'main/utils/AppTheme.dart';

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();
BaseLanguage? language;

void main() {
  runApp(MyApp());
}

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.green));
    return MaterialApp(
      title: 'Plant Signal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash(),
    );
  }
}
*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
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
