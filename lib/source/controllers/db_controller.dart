import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:plant_signal/source/controllers/user_controller.dart';
import 'package:plant_signal/source/model/session.dart';
import 'package:plant_signal/source/model/user.dart';
import 'package:plant_signal/source/screen/edit_profile_screen.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(AppUser user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<AppUser> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();
      print("${_doc.data()!.entries}");
      Get.off(() => EditProfileScreen(
            isEditProfile: false,
          ));
      return AppUser.fromDocumentSnapshot(userMap: _doc.data(), id: uid);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> editUserProfile(AppUser user) async {
    try {
      print(user.id);
      await _firestore.collection("users").doc(user.id).update({
        "phoneNumber": user.name,
        "fullName": user.phoneNumber,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> addTodo(String content, String uid) async {
    try {
      await _firestore.collection("users").doc(uid).collection("todos").add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> getInfo() async {
    try {
      await _firestore
          .collection("information")
          .doc()
          .collection("app_information")
          .get();
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<void> addUserSession(Session sess) async {
    try {
      await _firestore
          .collection("users")
          .doc(Get.find<UserController>().user.id)
          .collection("sessions")
          .add({
        'time': sess.time,
        'mode': sess.mode,
        'status': sess.status,
      });
      addGlobalSessions(sess);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addGlobalSessions(Session sess) async {
    try {
      await _firestore.collection("scans").doc().set({
        'time': sess.time,
        'mode': sess.mode,
        'status': sess.status,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addReview(
      {required String crop,
      required String feedbackType,
      required String contact,
      required String feedback}) async {
    try {
      await _firestore.collection("feedbacks").doc().set({
        'crop': crop,
        'type': feedbackType,
        'contact': contact,
        'feedback': feedback,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<Session>> getUserSessions() {
    return _firestore
        .collection("users")
        .doc(Get.find<UserController>().user.id)
        .collection("sessions")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<Session> retVal = List.empty(growable: true);
      query.docs.forEach((element) {
        retVal.add(Session.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }
}
