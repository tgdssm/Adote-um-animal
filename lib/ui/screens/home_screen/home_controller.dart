import 'package:firebase_auth/firebase_auth.dart' as AuthUser;
import 'package:pet_adoption_flutter_app/data/models/animal.dart';
import 'package:pet_adoption_flutter_app/data/providers/animal_provider.dart';
import 'package:pet_adoption_flutter_app/data/providers/authentication_provider.dart';

class HomeController {
  final _animalProvider = AnimalProvider();
  final _authProvider = AuthentificationPrivider();

  Future<List<Animal>> read({String filter, String city}) async{
    return await this._animalProvider.read(filter: filter, city: city);
  }

  signOut() {
    _authProvider.signOut();
  }

  AuthUser.User getCurrentUser() {
    return this._authProvider.getCurrentUser();
  }
}