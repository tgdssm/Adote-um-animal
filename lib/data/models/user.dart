import 'package:firebase_auth/firebase_auth.dart' as AuthUser;

class User {
  String email;
  String displayName;
  String uid;
  String photoUrl;
  // User({this.displayName, this.email, this.photoUrl, this.uid});

  User.fromJson(AuthUser.User user) {
    this.displayName = user.displayName;
    this.email = user.email;
    this.photoUrl = user.photoURL;
    this.uid = user.uid;
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': this.displayName,
      'email': this.email,
      'photoUrl': this.photoUrl,
      'uid': this.uid,
    };
  }
}