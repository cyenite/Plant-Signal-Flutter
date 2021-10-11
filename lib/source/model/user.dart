import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String? id;
  String? email;
  String? phoneNumber;
  String? name;

  AppUser({this.id, this.email, this.phoneNumber, this.name});

  AppUser.fromDocumentSnapshot({required DocumentSnapshot userMap}) {
    this.id = userMap.id;
    this.email = userMap['email'];
    this.phoneNumber = userMap['phone'];
    this.name = userMap['name'];
  }
}
