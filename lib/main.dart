import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_flutter_app/ui/screens/login_screen/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Alcubierre',
      primaryColor: Colors.grey[300],
    ),
    title: 'Pet Adoption',
    home: LoginScreen(),
  ));
}