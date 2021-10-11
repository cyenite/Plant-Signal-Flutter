import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_signal/source/controllers/auth_controller.dart';
import 'package:plant_signal/source/screen/WADashboardScreen.dart';
import 'package:plant_signal/source/screen/WALoginScreen.dart';

import 'controllers/user_controller.dart';

class RootApp extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return WADashboardScreen();
        } else {
          return WALoginScreen();
        }
      },
    );
  }
}
