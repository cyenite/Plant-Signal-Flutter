import 'package:cloud_firestore/cloud_firestore.dart';

class Session {
  String? mode;
  String? status;
  String? time;

  Session({required this.mode, required this.status, required this.time});

  Session.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    this.mode = snapshot['mode'];
    this.status = snapshot['status'];
    this.time = snapshot['time'].toString();
  }
}
