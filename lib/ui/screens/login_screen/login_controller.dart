import 'package:get/get.dart';
import 'package:pet_adoption_flutter_app/data/models/user.dart';
import 'package:pet_adoption_flutter_app/data/providers/authentication_provider.dart';
class LoginController extends GetxController{
  final _authProvider = AuthentificationPrivider();
  RxBool load = false.obs;

  Future<User> login() async{
    final credencialUser = await _authProvider.signInWithGoogle();
    return User.fromJson(credencialUser.user);
  }

}