import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:plant_signal/source/model/session.dart';
import 'package:plant_signal/source/model/user.dart';

class UserController extends GetxController {
  RxList<Session> sessionList = List<Session>.empty(growable: true).obs;
  Rx<AppUser> _userModel = AppUser().obs;
  late Rx<String> otpCode;
  Rx<String> captureMode = "Cam".obs;
  AppUser get user => _userModel.value;

  List<Session> get sessions => sessionList.value;

  set user(AppUser value) => this._userModel.value = value;

  void clear() {
    _userModel.value = AppUser();
  }
}
