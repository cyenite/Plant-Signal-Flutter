class AppUser {
  String? id;
  String? email;
  String? phoneNumber;
  String? name;

  AppUser({this.id, this.email, this.phoneNumber, this.name});

  AppUser.fromDocumentSnapshot(
      {required Map<String, dynamic>? userMap, required String id}) {
    this.id = id;
    this.email = userMap!['email'];
    //this.phoneNumber = userMap['phone'];
    this.name = userMap['name'];
  }
}
