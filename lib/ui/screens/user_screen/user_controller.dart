import 'package:pet_adoption_flutter_app/data/models/user.dart';
import 'package:pet_adoption_flutter_app/utils/globals.dart';
import 'package:firebase_auth/firebase_auth.dart' as AuthUser;

class UserController {

  User getCurrentUser() {
    return User.fromJson(authProvider);
  }

  String replaceName(String name) {
    String newName = '';
    int countSpaces = 0;
    for(int i = 0; i < name.length; i++) {
      if(name[i] == ' ')
        countSpaces ++;
      if(countSpaces < 2)
        newName += name[i];
    }
    return newName;
  }
}