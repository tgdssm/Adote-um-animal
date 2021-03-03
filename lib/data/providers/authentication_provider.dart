import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthentificationPrivider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount signInAccount = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication signInAuthentication =
        await signInAccount.authentication;
    final GoogleAuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: signInAuthentication.idToken,
        accessToken: signInAuthentication.accessToken);
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(authCredential);
    return userCredential;
  }

  User getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  signOut() {
    _firebaseAuth.signOut();
  }
}
