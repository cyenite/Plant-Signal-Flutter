import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:plant_signal/source/model/user.dart';
import 'package:plant_signal/source/screen/WAEditProfileScreen.dart';

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
      Get.off(()=>WAEditProfileScreen(
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
  /*Stream<List<TodoModel>> todoStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("todos")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TodoModel> retVal = List();
      query.documents.forEach((element) {
        retVal.add(TodoModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }*/

  Future<void> updateTodo(bool newValue, String uid, String todoId) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({"done": newValue});
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
