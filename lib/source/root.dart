import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_signal/source/controllers/auth_controller.dart';
import 'package:plant_signal/source/screen/dashboard_screen.dart';
import 'package:plant_signal/source/screen/login_screen.dart';

import 'controllers/user_controller.dart';

class RootApp extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(initState: (_) async {
      Get.put<UserController>(UserController());
    }, builder: (_) {
      if (Get.find<UserController>().user.isNull) {
        return DashboardScreen();
      } else {
        return LoginScreen();
      }
    });
  }
}
