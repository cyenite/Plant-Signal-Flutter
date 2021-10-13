import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_signal/source/controllers/user_controller.dart';
import 'package:plant_signal/source/model/user.dart';
import 'package:plant_signal/source/screen/dashboard_screen.dart';
import 'package:plant_signal/source/screen/login_screen.dart';
import 'package:plant_signal/source/screen/policy_screen.dart';

import 'db_controller.dart';

class AuthController extends GetxController {
  RxBool loggedIn = false.obs;
  RxString errorMessage = ''.obs;
  FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> _firebaseUser = Rx(_auth.currentUser);

  User? get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create user in database.dart
      AppUser _user = AppUser(
        id: _authResult.user!.uid,
        name: name,
        email: _authResult.user!.email,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.off(() => LoginScreen());
      }
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      print(_authResult.user!.uid);
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user!.uid);
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void updateUser(String name, String phone, bool isProfileEdit) async {
    try {
      AppUser _user = Get.find<UserController>().user;
      _user.phoneNumber = phone;
      _user.name = name;
      if (await Database().editUserProfile(_user)) {
        if (isProfileEdit) {
          Get.back();
        } else {
          verifyPhoneNumber();
        }
      } else {
        Get.snackbar(
          "Error",
          "Could not update your profile. Please try again.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error creating Account",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void verifyPhoneNumber() async {
    Get.snackbar(
      "Checking info...",
      "Please wait",
      snackPosition: SnackPosition.BOTTOM,
    );
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: Get.find<UserController>().user.phoneNumber!,
      verificationCompleted: (PhoneAuthCredential credential) {
        Get.snackbar(
          "Complete",
          "Verification successful",
          snackPosition: SnackPosition.BOTTOM,
        );
        Timer(Duration(seconds: 5), () {
          Get.off(() => DashboardScreen());
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar(
          "Error",
          "Verification not successful",
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        Get.off(() => PolicyScreen(verificationId: verificationId));
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void completePhoneRegistration(String verificationId) async {
    try {
      String smsCode = Get.find<UserController>().otpCode.value;
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      print("Credential: ${credential.toString()}");
      // Sign the user in (or link) with the credential
      await _auth.signInWithCredential(credential);

      Get.off(() => DashboardScreen());
    } catch (e) {
      Get.snackbar(
        "Error",
        "Verification code is incorrect",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<UserCredential> loginWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
