import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:plant_signal/source/model/user.dart';

class UserController extends GetxController {
  Rx<AppUser> _userModel = AppUser().obs;

  AppUser get user => _userModel.value;

  set user(AppUser value) => this._userModel.value = value;

  void clear() {
    _userModel.value = AppUser();
  }
}