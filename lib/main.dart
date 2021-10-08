import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/splash/spalsh_screen.dart';

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
        title: '$mainAppName${!isMobile ? ' ${platformName()}' : ''}',
        home: WASplashScreen(),
        theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
        navigatorKey: navigatorKey,
        scrollBehavior: SBehavior(),
      ),
    );
  }
}